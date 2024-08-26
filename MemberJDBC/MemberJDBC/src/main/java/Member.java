import java.util.Date;

public class Member {
    private int mno;            // int
    private String id;         // varchar(20)
    private String password;   // varchar(20)
    private String name;       // varchar(20)
    private String gender;     // varchar(1)
    private int age;            // int
    private String email;      // varchar(30)
    private String phone;      // char(13)
    private String address;    // varchar(200)
    private String hobby;      // varchar(100)
    private Date birthday;     // date
    private Date enrolldate;   // datetime

    public Member() {
    }

    public Member(int mno, String id, String password, String name, String gender, int age, String email, String phone, String address, String hobby, Date birthday, Date enrolldate) {
        this.mno = mno;
        this.id = id;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.age = age;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.hobby = hobby;
        this.birthday = birthday;
        this.enrolldate = enrolldate;
    }

    public int getMno() {
        return mno;
    }

    public void setMno(int mno) {
        this.mno = mno;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getEnrolldate() {
        return enrolldate;
    }

    public void setEnrolldate(Date enrolldate) {
        this.enrolldate = enrolldate;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Member{");
        sb.append("mno=").append(mno);
        sb.append(", id='").append(id).append('\'');
        sb.append(", password='").append(password).append('\'');
        sb.append(", name='").append(name).append('\'');
        sb.append(", gender='").append(gender).append('\'');
        sb.append(", age=").append(age);
        sb.append(", email='").append(email).append('\'');
        sb.append(", phone='").append(phone).append('\'');
        sb.append(", address='").append(address).append('\'');
        sb.append(", hobby='").append(hobby).append('\'');
        sb.append(", birthday=").append(birthday);
        sb.append(", enrolldate=").append(enrolldate);
        sb.append('}');
        return sb.toString();
    }
}
