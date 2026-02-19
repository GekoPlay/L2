
import fr.univsavoie.java.swing.tortue.Tortue;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class DroiteListener implements ActionListener {

    // modele
    private Tortue t;
    private tortueFrame dessinTortue;

    public DroiteListener(Tortue t, tortueFrame dessinTortue) {
        this.t = t;
        this.dessinTortue = dessinTortue;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        t.tournerDroite();
        dessinTortue.repaint();
    }
}