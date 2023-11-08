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


    public List<Produit> getCatalogue() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Produit> catalogue = new ArrayList<>();

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
                    catalogue.add(produit);
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

        return catalogue;
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
    public List<Produit> getProductBySearch(String search) {

        List<Produit> produits = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = connectToDatabase();
            if (connection != null) {
                String query = "SELECT * FROM produit WHERE nom LIKE ? OR motsCles LIKE ? OR marque LIKE ?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, "%" + search + "%");
                preparedStatement.setString(2, "%" + search + "%");
                resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    Produit produit = new Produit();
                    produit.setId(resultSet.getInt("ID_Produit"));
                    produit.setNom(resultSet.getString("nom"));
                    produit.setMarque(resultSet.getString("marque"));
                    produit.setDescription(resultSet.getString("description"));
                    produit.setMotsCles(resultSet.getString("motsCles"));
                    produit.setPrix(resultSet.getString("prix"));
                    produit.setUrlPicture(resultSet.getString("urlPicture"));

                    produits.add(produit);
                }

                return produits;
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

        return null; // Si aucun produit ne correspond à la recherche
    }

    public boolean checkLogin(String email, String motDePasse) throws SQLException {
        String sql = "SELECT COUNT(*) FROM client WHERE email = ? AND motDePasse = ?";
        try (Connection conn = connectToDatabase();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, motDePasse);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }
        return false;
    }

    public int getUserIdFromDatabase(String email) throws SQLException {
        String sql = "SELECT ID_Client FROM client WHERE email = ?";
        try (Connection conn = connectToDatabase();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setString(1, email);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("ID_Client");
                }
            }
        }
        return -1; // Retourne -1 si l'utilisateur n'a pas été trouvé dans la base de données
    }

    public boolean register(String prenom, String nom, String email, String motDePasse) {
        // Assurez-vous d'adapter les détails de votre base de données
        String selectSQL = "SELECT COUNT(*) FROM client WHERE email = ?";
        String insertSQL = "INSERT INTO client (nom, prenom, email, motDePasse) VALUES (?, ?, ?, ?)";

        try (Connection connection = connectToDatabase();
             PreparedStatement selectStatement = connection.prepareStatement(selectSQL);
             PreparedStatement insertStatement = connection.prepareStatement(insertSQL)) {


            selectStatement.setString(1, email);
            ResultSet resultSet = selectStatement.executeQuery();

            if (resultSet.next() && resultSet.getInt(1) == 0) {

                insertStatement.setString(1, nom);
                insertStatement.setString(2, prenom);
                insertStatement.setString(3, email);
                insertStatement.setString(4, motDePasse);


                int rowsAffected = insertStatement.executeUpdate();


                return rowsAffected == 1;
            } else {

                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();

            return false;
        }
    }

    public List<VarianteProduit> getVariantesByProductId(int productId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<VarianteProduit> variantes = new ArrayList<>();

        try {
            connection = connectToDatabase();
            if (connection != null) {
                String query = "SELECT * FROM variantes_produit WHERE id_produit = ? ORDER BY pointure ASC;";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, productId);
                resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    VarianteProduit variante = new VarianteProduit(
                            resultSet.getInt("ID_Variante"),
                            resultSet.getInt("ID_produit"),
                            resultSet.getInt("pointure"),
                            resultSet.getInt("stock")
                    );
                    variantes.add(variante);
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

        return variantes;
    }

}
