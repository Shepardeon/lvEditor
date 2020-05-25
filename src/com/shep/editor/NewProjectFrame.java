package com.shep.editor;

import com.shep.model.Project;

import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

public class NewProjectFrame extends JFrame {
    private JLabel lblProjectName;
    private JTextField texFldProjectName;
    private JLabel lblProjectPath;
    private JTextField texFldProjectPath;
    private JButton btnNewProject;

    public NewProjectFrame(ProjectFrame p_parentFrame) {
        InitFrame();
        InitContent(p_parentFrame);
    }

    private void InitFrame() {
        this.setTitle("New Project");
        this.setSize(300, 200);
        this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        this.setLocationRelativeTo(null);
        this.setResizable(false);
        this.setVisible(true);
    }

    private void InitContent(ProjectFrame p_parentFrame) {
        JPanel contentPane = (JPanel) this.getContentPane();
        SpringLayout layout = new SpringLayout();

        /* Main Layout */
        //----------------------------------------------------------------------------------------------------------
        this.lblProjectName = new JLabel("Project Name");
        layout.putConstraint(SpringLayout.HORIZONTAL_CENTER, lblProjectName, 0,
                                SpringLayout.HORIZONTAL_CENTER, contentPane);
        layout.putConstraint(SpringLayout.NORTH, lblProjectName, 20, SpringLayout.NORTH, contentPane);

        this.texFldProjectName = new JTextField(20);
        layout.putConstraint(SpringLayout.HORIZONTAL_CENTER, texFldProjectName, 0,
                                SpringLayout.HORIZONTAL_CENTER, contentPane);
        layout.putConstraint(SpringLayout.NORTH, texFldProjectName, 20, SpringLayout.NORTH, lblProjectName);

        this.lblProjectPath = new JLabel("Project Path");
        layout.putConstraint(SpringLayout.HORIZONTAL_CENTER, lblProjectPath, 0,
                                SpringLayout.HORIZONTAL_CENTER, contentPane);
        layout.putConstraint(SpringLayout.NORTH, lblProjectPath, 20, SpringLayout.NORTH, texFldProjectName);

        this.texFldProjectPath = new JTextField(Project.DEFAULT_PATH, 20);
        layout.putConstraint(SpringLayout.HORIZONTAL_CENTER, texFldProjectPath, 0,
                                SpringLayout.HORIZONTAL_CENTER, contentPane);
        layout.putConstraint(SpringLayout.NORTH, texFldProjectPath, 20, SpringLayout.NORTH, lblProjectPath);

        this.btnNewProject = new JButton("Create New Project");
        layout.putConstraint(SpringLayout.HORIZONTAL_CENTER, btnNewProject, 0,
                                SpringLayout.HORIZONTAL_CENTER, contentPane);
        layout.putConstraint(SpringLayout.NORTH, btnNewProject, 40, SpringLayout.NORTH, texFldProjectPath);

        /* Main Logic */
        //----------------------------------------------------------------------------------------------------------
        this.texFldProjectName.getDocument().addDocumentListener(
                new NewProjectDocumentListener(texFldProjectName, texFldProjectPath)
        );

        this.btnNewProject.addActionListener(e -> {
            if (!texFldProjectName.getText().isBlank() && !texFldProjectPath.getText().isBlank()) {
                // TODO: Change logic, we should set project only if project could be created
                p_parentFrame.SetProject(new Project(texFldProjectName.getText(), texFldProjectPath.getText()));
                p_parentFrame.CreateProject();
                this.setVisible(false);
                this.dispose();
            }
            else {
                // TODO: Add some output for the user
                System.out.println("WARN: Can't create project with empty name or just white spaces");
            }
        });

        contentPane.setLayout(layout);
        contentPane.add(lblProjectName);
        contentPane.add(texFldProjectName);
        contentPane.add(lblProjectPath);
        contentPane.add(texFldProjectPath);
        contentPane.add(btnNewProject);
    }

    class NewProjectDocumentListener implements DocumentListener {

        private JTextField projectName;
        private JTextField projectPath;

        NewProjectDocumentListener(JTextField p_projectName, JTextField p_projectPath) {
            this.projectName = p_projectName;
            this.projectPath = p_projectPath;
        }

        @Override
        public void insertUpdate(DocumentEvent e) {
            UpdatePath();
        }

        @Override
        public void removeUpdate(DocumentEvent e) {
            UpdatePath();
        }

        @Override
        public void changedUpdate(DocumentEvent e) {
            UpdatePath();
        }

        private void UpdatePath() {
            // TODO: Change this logic so the path won't "reset"
            this.projectPath.setText(Project.DEFAULT_PATH + Project.GetNiceName(this.projectName.getText()));
        }
    }
}
