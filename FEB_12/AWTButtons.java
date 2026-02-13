package FEB_12;

import java.awt.*;
import java.awt.event.*;

public class AWTButtons extends Frame implements ActionListener {

    Button btnA, btnB;
    Label result;

    AWTButtons() {
        setLayout(new FlowLayout());

        btnA = new Button("A");
        btnB = new Button("B");
        result = new Label("Click a button");

        add(btnA);
        add(btnB);
        add(result);

        btnA.addActionListener(this);
        btnB.addActionListener(this);

        setSize(300, 200);
        setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == btnA) {
            result.setText("Name: Zeel, Course: MCA, Roll: 1272240551, College: MIT-WPU");
        } else {
            result.setText("Previous Semester CGPA: 8.71");
        }
    }

    public static void main(String[] args) {
        new AWTButtons();
    }
}
