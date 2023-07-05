package model;

public class Customer {
    private int id;
    private String name;
    private int age;
    private String imgAddress;

    public Customer(int id, String name, int age, String imgAddress) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.imgAddress = imgAddress;
    }

    public Customer() {
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getImgAddress() {
        return imgAddress;
    }

    public void setImgAddress(String imgAddress) {
        this.imgAddress = imgAddress;
    }

}
