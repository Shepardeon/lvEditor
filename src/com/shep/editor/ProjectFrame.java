package com.shep.editor;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ProjectFrame extends JFrame {
    // Main menu bar
    private JMenuBar menuBar;
    private JMenu menuFile;
    private JMenuItem fileNew;
    private JMenuItem fileOpen;

    public ProjectFrame() {
        InitFrame();
        InitMenu();
    }

    private void InitFrame() {
        this.setTitle("lvEditor - v0.1.0");
        this.setSize(1000, 600);
        this.setDefaultCloseOperation(EXIT_ON_CLOSE);
        this.setLocationRelativeTo(null);
        this.setVisible(true);
    }

    private void InitMenu() {
        this.menuBar = new JMenuBar();

        this.menuFile = new JMenu("File");
        this.menuFile.setMnemonic('f');

        this.fileNew = new JMenuItem("New Project");
        this.fileNew.addActionListener(a -> new NewProjectFrame());
        this.fileNew.setMnemonic('n');
        this.fileOpen = new JMenuItem("Open Project");
        this.fileOpen.setMnemonic('o');

        this.menuFile.add(fileNew);
        this.menuFile.add(fileOpen);

        this.menuBar.add(menuFile);
        this.setJMenuBar(menuBar);
    }
}