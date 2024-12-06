package com.drivvy.models;

import lombok.Data;

@Data
public class User {
    private int id;
    private String firstName;
    private String lastName;
    private byte[] avatar;
    private String description;
    private String email;

    public User(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

}
