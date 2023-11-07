package com.example.run;

import java.util.HashMap;
import java.util.Map;

public class Panier {
    private Map<Integer, Integer> items = new HashMap<>();

    public Map<Integer, Integer> getItems() {
        return items;
    }

    public void ajouterVariante(int idVariante) {
        // Si l'idVariante est déjà dans le panier, augmentez la quantité de 1
        if (items.containsKey(idVariante)) {
            int quantiteActuelle = items.get(idVariante);
            items.put(idVariante, quantiteActuelle + 1);
        } else {
            // Si l'idVariante n'est pas encore dans le panier, ajoutez-le avec une quantité de 1
            items.put(idVariante, 1);
        }
    }

    public void retirerVariante(int idVariante) {
        // Si l'idVariante est dans le panier, diminuez la quantité de 1
        if (items.containsKey(idVariante)) {
            int quantiteActuelle = items.get(idVariante);
            if (quantiteActuelle > 1) {
                items.put(idVariante, quantiteActuelle - 1);
            } else {
                // Si la quantité atteint 1, retirez complètement l'idVariante du panier
                items.remove(idVariante);
            }
        }
    }


    public Map<Integer, Integer> getContenu() {
        return items;
    }
}