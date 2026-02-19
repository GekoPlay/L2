
import fr.univsavoie.java.swing.tortue.Tortue;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class GaucheLIstener implements ActionListener {

    // modele
    private Tortue t;
    private tortueFrame dessinTortue;

    public GaucheLIstener(Tortue t, tortueFrame dessinTortue) {
        this.t = t;
        this.dessinTortue = dessinTortue;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        t.tournerGauche();
        dessinTortue.repaint();
    }
}