package com.shep.model;

import com.shep.service.ProjectFileVisitor;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Project {
    public static final String TEMPLATES_FOLDER = System.getProperty("user.dir")
            + File.separator + "res" + File.separator + "templates" + File.separator;

    public static final String DEFAULT_PATH = System.getProperty("user.home")
            + File.separator + "lvProjects" + File.separator;

    private String name;
    private String path;
    private String template;

    public Project() {
        this.name = "untitled";
        this.path = DEFAULT_PATH + "untitled";
        this.template = "emptyProject";
    }

    public Project(String p_name) {
        this();
        this.name = p_name;
        this.path = DEFAULT_PATH + this.GetNiceName();
    }

    public Project(String p_name, String p_path) {
        this();
        this.name = p_name;
        this.path = p_path;
    }

    public Project(Project p_project) {
        this.name = p_project.name;
        this.path = p_project.path;
        this.template = p_project.template;
    }

    public String GetName() {
        return name;
    }
    public String GetPath() {
        return path;
    }

    /**
     * Function replacing spaces with underscores
     * @return nice name for path
     */
    public static String GetNiceName(String name) {
        return name.replace(' ', '_');
    }

    /**
     * Function replacing spaces with underscores
     * @return project's nice name for path
     */
    public String GetNiceName() {
        return Project.GetNiceName(this.name);
    }

    /**
     * Function that will create the project files on disk
     * based on the project's properties
     */
    public void CreateProject() throws IOException {
        if (this.CreateMainDir()) {
            Path src = Paths.get(TEMPLATES_FOLDER + this.template);
            Path dst = Paths.get(this.path);

            ProjectFileVisitor visitor = new ProjectFileVisitor(src, dst);

            Files.walkFileTree(src, visitor);
        }
        else {
            System.err.println("ERR: There was an error while creating main directory");
        }
    }

    /**
     * Function that will ensure all required directories are
     * properly created beforehand
     */
    private boolean CreateMainDir() {
        File mainDir = new File(this.path.substring(0, path.lastIndexOf(File.separator)));

        if (!mainDir.exists())
            return mainDir.mkdirs();

        return true;
    }
}
