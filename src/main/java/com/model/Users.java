package com.model;

public class Users {

    private int id;
    private String name;
    private String email;
    private String password;
    private String role;

    // Default constructor
    public Users() {
        super();
    }

    // Constructor for creating a new user
    public Users(String name, String email, String password, String role) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    // Constructor for complete user data
    public Users(int id, String name, String email,
                 String password, String role) {

        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Users [id=" + id
                + ", name=" + name
                + ", email=" + email
                + ", role=" + role + "]";
    }
}
