import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import fr.univsavoie.java.swing.tortue.Tortue;

public class ToucheListener  extends KeyAdapter {

    // modele
    private Tortue t;
    // dessin de la cuve
    private tortueFrame DessinTortue;

    public ToucheListener(Tortue t, tortueFrame DessinTortue) {
        super();
        this.t = t;
        this.DessinTortue= DessinTortue;
    }

    @Override
    public void keyPressed(KeyEvent e) {
        switch (e.getKeyCode()) {
            case KeyEvent.VK_UP:
                t.avancer();
                DessinTortue.repaint();
                break;
            case KeyEvent.VK_RIGHT:
                t.tournerDroite();
                DessinTortue.repaint();
                break;
            case KeyEvent.VK_LEFT:
                t.tournerGauche();
                DessinTortue.repaint();
                break;
            default:
                break;
        }
    }



}