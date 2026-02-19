import fr.univsavoie.java.swing.tortue.Tortue;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class SourisListener extends MouseAdapter {

    private Tortue t;
    private tortueFrame dessinTortue;

    public SourisListener(Tortue t, tortueFrame dessinTortue) {
        // ESSENTIEL : on stocke les références reçues
        this.t = t;
        this.dessinTortue = dessinTortue;
    }

    @Override
    public void mousePressed(MouseEvent e) {
        // On donne le focus au panneau pour que le clavier fonctionne aussi
        dessinTortue.requestFocus();

        System.out.println("Action souris : x=" + e.getX() + " y=" + e.getY());

        if(e.getX()> t.getX() && e.getY()>t.getY() && e.getX()>e.getY() ){
            while(t.getDirection() != 3){
                t.tournerDroite();
            }
        } else if (e.getX()> t.getX() && e.getY()>t.getY() && e.getX()<e.getY()) {
            while(t.getDirection() != 2){
                t.tournerDroite();
            }
        }

        // Correction du nom de la variable : dessinTortue au lieu de dessin
        dessinTortue.repaint();
    }
}