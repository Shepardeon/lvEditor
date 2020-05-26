package com.shep.editor;

import com.shep.model.Project;

import javax.swing.*;
import java.io.File;
import java.nio.file.Paths;

public class OpenProjectFrame {
    private JFileChooser fileChooser;

    public OpenProjectFrame(ProjectFrame p_parentFrame) {
        String projectPath = Paths.get(Project.DEFAULT_PATH).toFile().exists() ?
                                Project.DEFAULT_PATH : System.getProperty("user.home");

        this.fileChooser = new JFileChooser();
        this.fileChooser.setCurrentDirectory(new File(projectPath));
        // TODO: User shouldn't be allowed to open any folder as a project
        this.fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
        int res = fileChooser.showOpenDialog(p_parentFrame);

        if (res == JFileChooser.APPROVE_OPTION) {
            String openedDir = fileChooser.getSelectedFile().getAbsolutePath();
            String projectName = openedDir.substring(openedDir.lastIndexOf(File.separator)+1);
            p_parentFrame.SetProject(new Project(projectName, openedDir));
        }
    }
}