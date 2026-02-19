

import javax.swing.*;
import java.awt.*;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import fr.univsavoie.java.swing.tortue.Tortue;

public class tortueFrame extends JPanel{

    private Tortue t;

    public tortueFrame(Tortue t) {
        this.t = t;
    }

    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.setColor(Color.RED);
        g.setColor(Color.BLUE);
        g.fillOval(t.getX(), t.getY(),100,100);

        if (t.getDirection() == 1){
            g.fillOval(t.getX()+30 , t.getY()-20, 40, 40);

        }else if  (t.getDirection() == 2){
            g.fillOval(t.getX()+30, t.getY()+80, 40, 40);

        }else if (t.getDirection() == 3){
            g.fillOval(t.getX()+80, t.getY()+30, 40 ,40);

        }else{
            g.fillOval(t.getX()-20, t.getY()+30, 40 ,40);

        }

    }
}
