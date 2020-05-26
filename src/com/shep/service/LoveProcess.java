package com.shep.service;

import java.io.IOException;

public class LoveProcess {
    private String projectPath;
    private String lovePath;

    public LoveProcess(String p_path) {
        this.projectPath = p_path;
        // Hard-coded for now
        // TODO: implement correct logic that will allow the user to choose were is love2D
        this.lovePath = "love";
    }

    public void Start() {
        ProcessBuilder pb = new ProcessBuilder(lovePath, projectPath);

        try {
            pb.start();
        } catch (IOException e) {
            // TODO: Log this.
            e.printStackTrace();
        }
    }
}
