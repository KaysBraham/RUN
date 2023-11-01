package com.example.run;
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

    public boolean insertClient(String nom, String prenom, String email, String motDePasse, int soldeCB) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = connectToDatabase();
            if (connection != null) {
                String query = "INSERT INTO client (Nom, Prenom, Email, `Mot de passe`, `Solde CB`) VALUES (?, ?, ?, ?, ?)";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, nom);
                preparedStatement.setString(2, prenom);
                preparedStatement.setString(3, email);
                preparedStatement.setString(4, motDePasse);
                preparedStatement.setInt(5, soldeCB);
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
                    produit.setNom(resultSet.getString("Nom"));
                    produit.setMarque(resultSet.getString("Marque"));
                    produit.setDescription(resultSet.getString("Description"));
                    produit.setPrix(resultSet.getString("Prix"));
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

}
