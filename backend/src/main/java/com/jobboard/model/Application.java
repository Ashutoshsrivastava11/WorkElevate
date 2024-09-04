package main.java.com.jobboard.model;

import javax.persistence.*;

@Entity
public class Application {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long jobId;
    private Long userId;
    private String status; // Applied, In Review, Accepted, Rejected

    // Constructors, Getters, and Setters

    public Application() {}

    public Application(Long jobId, Long userId, String status) {
        this.jobId = jobId;
        this.userId = userId;
        this.status = status;
    }

    // Getters and setters...
}
