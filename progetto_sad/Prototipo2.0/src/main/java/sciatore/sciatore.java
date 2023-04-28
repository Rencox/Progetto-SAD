// Questa classe rappresenta una pila di elementi generici
package sciatore;
class sciatore<E> {

    // Questa classe interna rappresenta un elemento della pila
    private class Elemento {
        E dato; // Il dato generico contenuto nell'elemento
        Elemento prev; // Il riferimento all'elemento precedente

        // Costruttore dell'elemento che accetta un dato generico
        public Elemento(E dato) {
            this.dato = dato;
            this.prev = null;
        }
    }

    private Elemento top; // Il riferimento all'elemento in cima alla pila
    private int size; // La dimensione della pila

    // Costruttore della pila vuota
    public sciatore() {
        this.top = null;
        this.size = 0;
    }

    // Questo metodo accetta un dato generico e lo inserisce in cima alla pila
    // Restituisce true se l'inserimento ha successo, false altrimenti
    public boolean push(E dato) {
        try {
            Elemento nuovo = new Elemento(dato); // Crea un nuovo elemento con il dato dato
            nuovo.prev = top; // Collega il nuovo elemento all'elemento in cima alla pila
            top = nuovo; // Aggiorna il riferimento all'elemento in cima alla pila
            size++; // Incrementa la dimensione della pila
            return true;
        } catch (Exception e) {
            System.out.println("Errore: " + e.getMessage());
            return false;
        }
    }

    // Questo metodo rimuove e restituisce l'elemento in cima alla pila
    // Restituisce null se la pila è vuota
    public E pop() {
        if (top == null) {
            System.out.println("Errore: pila vuota");
            return null;
        } else {
            Elemento temp = top; // Salva il riferimento all'elemento in cima alla pila
            top = top.prev; // Aggiorna il riferimento all'elemento in cima alla pila
            size--; // Decrementa la dimensione della pila
            return temp.dato; // Restituisce il dato dell'elemento rimosso
        }}
}