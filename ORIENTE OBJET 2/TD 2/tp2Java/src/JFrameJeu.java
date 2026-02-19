import fr.univsavoie.java.swing.tortue.Tortue;

import javax.swing.*;
import java.awt.Color; // <-- Importation nécessaire pour Color
import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.JFrame;
import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.HeadlessException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;


public class JFrameJeu extends JFrame {
    public static final int HAUTEUR = 800;
    public static final int LARGEUR = 800;

    public JFrameJeu() {
        this.setTitle("Jeu de la tortue");
        this.setSize(LARGEUR, HAUTEUR);
        this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        this.getContentPane().setBackground(Color.GREEN);


    JButton bGauche = new JButton("Gauche");
    JButton bAvancer = new JButton("Avancer");
    JButton bDroite = new JButton("Droite");

    Tortue tortue = new Tortue();
    tortueFrame tortueF = new tortueFrame(tortue);
    JPanel p = new JPanel();
    p.setLayout(new FlowLayout());
    p.add(bGauche);
    p.add(bAvancer);
    p.add(bDroite);
    p.setOpaque(false);

        GaucheLIstener l1 = new GaucheLIstener(tortue, tortueF);
        bGauche.addActionListener(l1);
        DroiteListener l2 = new DroiteListener(tortue, tortueF);
        bDroite.addActionListener(l2);
        AvancerListener l3 = new AvancerListener(tortue, tortueF);
        bAvancer.addActionListener(l3);


        SourisListener mouseListener = new SourisListener(tortue, tortueF);
       tortueF.addMouseListener(mouseListener);

        this.getContentPane().add(p,BorderLayout.SOUTH);
    this.getContentPane().add(tortueF,BorderLayout.CENTER);

    }


    // Méthode main pour lancer le programme
    public static void main(String[] args) {
        JFrame f = new JFrameJeu();
        f.setVisible(true);
    }
}