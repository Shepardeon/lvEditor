package com.shep.editor;

import javax.swing.*;
import java.awt.*;

public class NewProjectFrame extends JFrame {
    private final String DEFAULT_PATH = "C:\\Users\\";

    private JLabel lblProjectName;
    private JTextField texFldProjectName;
    private JLabel lblProjectPath;
    private JTextField texFldProjectPath;
    private JButton btnNewProject;

    public NewProjectFrame() {
        InitFrame();
        InitContent();
    }

    private void InitFrame() {
        this.setTitle("New Project");
        this.setSize(300, 200);
        this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        this.setLocationRelativeTo(null);
        this.setResizable(false);
        this.setVisible(true);
    }

    private void InitContent() {
        JPanel contentPane = (JPanel) this.getContentPane();
        SpringLayout layout = new SpringLayout();

        this.lblProjectName = new JLabel("Project Name");
        layout.putConstraint(SpringLayout.HORIZONTAL_CENTER, lblProjectName, 0, SpringLayout.HORIZONTAL_CENTER, contentPane);
        layout.putConstraint(SpringLayout.NORTH, lblProjectName, 20, SpringLayout.NORTH, contentPane);

        this.texFldProjectName = new JTextField(15);
        layout.putConstraint(SpringLayout.HORIZONTAL_CENTER, texFldProjectName, 0, SpringLayout.HORIZONTAL_CENTER, contentPane);
        layout.putConstraint(SpringLayout.NORTH, texFldProjectName, 20, SpringLayout.NORTH, lblProjectName);

        this.lblProjectPath = new JLabel("Project Path");
        layout.putConstraint(SpringLayout.HORIZONTAL_CENTER, lblProjectPath, 0, SpringLayout.HORIZONTAL_CENTER, contentPane);
        layout.putConstraint(SpringLayout.NORTH, lblProjectPath, 20, SpringLayout.NORTH, texFldProjectName);

        this.texFldProjectPath = new JTextField(DEFAULT_PATH, 15);
        layout.putConstraint(SpringLayout.HORIZONTAL_CENTER, texFldProjectPath, 0, SpringLayout.HORIZONTAL_CENTER, contentPane);
        layout.putConstraint(SpringLayout.NORTH, texFldProjectPath, 20, SpringLayout.NORTH, lblProjectPath);

        this.btnNewProject = new JButton("Create New Project");
        layout.putConstraint(SpringLayout.HORIZONTAL_CENTER, btnNewProject, 0, SpringLayout.HORIZONTAL_CENTER, contentPane);
        layout.putConstraint(SpringLayout.NORTH, btnNewProject, 40, SpringLayout.NORTH, texFldProjectPath);

        contentPane.setLayout(layout);
        contentPane.add(lblProjectName);
        contentPane.add(texFldProjectName);
        contentPane.add(lblProjectPath);
        contentPane.add(texFldProjectPath);
        contentPane.add(btnNewProject);
    }
}
