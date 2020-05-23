package com.shep.service;

import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;

public class ProjectFileVisitor extends SimpleFileVisitor<Path> {
    private Path source;
    private Path destination;

    public ProjectFileVisitor(Path p_source, Path p_destination) {
        this.source = p_source;
        this.destination = p_destination;
    }

    @Override
    public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
        Path newDir = destination.resolve(source.relativize(dir));

        try {
            Files.copy(dir, newDir);
        }
        catch (FileAlreadyExistsException ioException) {
            // TODO: Add log here.
            ioException.printStackTrace();
            return FileVisitResult.SKIP_SUBTREE;
        }

        return FileVisitResult.CONTINUE;
    }

    @Override
    public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
        Path newFile = destination.resolve(source.relativize(file));

        try {
            Files.copy(file, newFile);
        }
        catch (IOException ioException) {
            // TODO: Add log here.
            ioException.printStackTrace();
        }

        return  FileVisitResult.CONTINUE;
    }

    @Override
    public FileVisitResult postVisitDirectory(Path dir, IOException exc) throws IOException {
        return FileVisitResult.CONTINUE;
    }

    @Override
    public FileVisitResult visitFileFailed(Path file, IOException exc) throws IOException {
        //TODO: Add log here.
        exc.printStackTrace();

        return FileVisitResult.CONTINUE;
    }
}
