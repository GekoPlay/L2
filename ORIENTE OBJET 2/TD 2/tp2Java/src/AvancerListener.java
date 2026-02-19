
import fr.univsavoie.java.swing.tortue.Tortue;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AvancerListener implements ActionListener {

    // modele
    private Tortue t;
    private tortueFrame dessinTortue;

    public AvancerListener(Tortue t, tortueFrame dessinTortue) {
        this.t = t;
        this.dessinTortue = dessinTortue;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        t.avancer();
        dessinTortue.repaint();
    }
}