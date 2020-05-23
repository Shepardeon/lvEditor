package com.shep.editor;

public class Main {
    public static final String TITLE = "lvEditor";
    public static final String VERSION = "v0.1.0";

    /**
     * Function returning the formatted main window's title
     * @return formatted title of the editor
     */
    public static String GetTitle() {
        return TITLE + " - " + VERSION;
    }

    public static void main(String[] args) {
        new ProjectFrame();
    }
}
