package com.shep.model;

import java.io.File;

public class Project {
    public static final String DEFAULT_PATH = System.getProperty("user.home")
            + File.separator + "lvProjects" + File.separator;

    private String name;
    private String path;

    public Project() {
        this.name = "untitled";
        this.path = DEFAULT_PATH + "untitled";
    }

    public Project(String p_name) {
        this.name = p_name;
        this.path = DEFAULT_PATH + this.GetNiceName();
    }

    public Project(String p_name, String p_path) {
        this.name = p_name;
        this.path = p_path;
    }

    public Project(Project p_project) {
        this.name = p_project.name;
        this.path = p_project.path;
    }

    public String GetName() {
        return name;
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
}
