package main.java.com.jobboard.model;

import javax.persistence.*;

@Entity
public class Job {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String description;
    private String company;
    private String location;
    private String type; // Full-time, Part-time, etc.

    // Constructors, Getters, and Setters

    public Job() {}

    public Job(String title, String description, String company, String location, String type) {
        this.title = title;
        this.description = description;
        this.company = company;
        this.location = location;
        this.type = type;
    }

    // Getters and setters...
}
