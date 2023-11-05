package com.example.run;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import javax.management.Query;
import java.io.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DataBaseController {


    public Connection connectToDatabase() {
        String dbUrl = "jdbc:mysql://localhost:3306/rundb"; // Mettez à jour avec votre propre URL de base de données.
        String dbUser = "root";
        String dbPassword = "";

        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }

    // Méthode pour fermer la connexion à la base de données
    public void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean insertClient(String nom, String prenom, String email, String motDePasse, boolean verifSolde) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = connectToDatabase();
            if (connection != null) {
                String query = "INSERT INTO client (nom, prenom, email, motDePasse, verifSolde) VALUES (?, ?, ?, ?, ?)";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, nom);
                preparedStatement.setString(2, prenom);
                preparedStatement.setString(3, email);
                preparedStatement.setString(4, motDePasse);
                preparedStatement.setBoolean(5, verifSolde);
                int rowsAffected = preparedStatement.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            closeConnection(connection);
        }

        return false;
    }


    public List<Produit> getAllProducts() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Produit> produits = new ArrayList<>();

        try {
            connection = connectToDatabase();
            if (connection != null) {
                String query = "SELECT * FROM produit";
                preparedStatement = connection.prepareStatement(query);
                resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    Produit produit = new Produit();
                    produit.setId(resultSet.getInt("ID_Produit"));
                    produit.setNom(resultSet.getString("nom"));
                    produit.setMarque(resultSet.getString("marque"));
                    produit.setDescription(resultSet.getString("description"));
                    produit.setPrix(resultSet.getString("prix"));
                    produit.setUrlPicture(resultSet.getString("urlPicture"));
                    produits.add(produit);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            closeConnection(connection);
        }

        return produits;
    }
    public Produit getProductById(int productId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = connectToDatabase();
            if (connection != null) {
                String query = "SELECT * FROM produit WHERE ID_Produit=?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, productId);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    Produit produit = new Produit();
                    produit.setId(resultSet.getInt("ID_Produit"));
                    produit.setNom(resultSet.getString("nom"));
                    produit.setMarque(resultSet.getString("marque"));
                    produit.setDescription(resultSet.getString("description"));
                    produit.setPrix(resultSet.getString("prix"));
                    produit.setUrlPicture(resultSet.getString("urlPicture"));
                    return produit;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            closeConnection(connection);
        }

        return null; // Si aucun produit correspondant à l'ID n'est trouvé.
    }



    public Produit getProductByKeyWord(String keyWord) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = connectToDatabase();
            if (connection != null) {
                String query = "SELECT * FROM produit WHERE motCles '%keyWord%' ";
                preparedStatement = connection.prepareStatement(query);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    Produit produit = new Produit();
                    produit.setId(resultSet.getInt("ID_Produit"));
                    produit.setNom(resultSet.getString("nom"));
                    produit.setMarque(resultSet.getString("marque"));
                    produit.setDescription(resultSet.getString("description"));
                    produit.setPrix(resultSet.getString("prix"));
                    produit.setMotCles(resultSet.getString("motCles"));
                    produit.setUrlPicture(resultSet.getString("urlPicture"));
                    return produit;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            closeConnection(connection);
        }

        return null; // Si aucun produit correspondant à la recherche
    }
    }

