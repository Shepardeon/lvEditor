package com.shep.editor;

import com.shep.model.Project;
import com.shep.service.LoveProcess;

import javax.swing.*;
import java.awt.*;
import java.io.IOException;

public class ProjectFrame extends JFrame {
    // Main menu bar
    private JMenuBar menuBar;
    private JMenu menuFile;
    private JMenuItem fileNew;
    private JMenuItem fileOpen;

    // Main tool bar
    private JToolBar toolBar;
    private JButton runButton;

    private Project workedProject;

    public ProjectFrame() {
        InitFrame();
        InitMenu();
        InitToolbar();
    }

    private void InitFrame() {
        this.setTitle(Main.GetTitle());
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
        this.fileNew.addActionListener(a -> new NewProjectFrame(this));
        this.fileNew.setMnemonic('n');
        this.fileOpen = new JMenuItem("Open Project");
        this.fileOpen.setMnemonic('o');

        this.menuFile.add(fileNew);
        this.menuFile.add(fileOpen);

        this.menuBar.add(menuFile);
        this.setJMenuBar(menuBar);
    }

    private void InitToolbar() {
        this.toolBar = new JToolBar();
        this.toolBar.setFloatable(false);

        this.runButton = new JButton("Run");
        this.runButton.setEnabled(false);
        this.runButton.setToolTipText("Open project first");
        this.runButton.addActionListener(a -> new LoveProcess(workedProject.GetPath()).Start());

        this.toolBar.add(runButton);
        this.getContentPane().add(toolBar, BorderLayout.NORTH);
    }

    public void SetProject(Project p_project) {
        this.workedProject = new Project(p_project);
        this.setTitle(Main.GetTitle() + " - " + workedProject.GetName());

        this.runButton.setEnabled(true);
        this.runButton.setToolTipText(null);
    }

    /**
     * Function that will create a new project on disk
     */
    public void CreateProject() {
        try {
            this.workedProject.CreateProject();
        }
        catch (IOException e) {
            // TODO: Log this
            e.printStackTrace();
        }
    }
}
