package SqlTest.Customer.model;

public class Customer {
    public int custId;
    public String name;
    public int age;
    public Customer() {
    }
    public Customer(int custId, String name, int age) {
        this.custId = custId;
        this.name = name;
        this.age = age;
    }
    public int getCustId() {
        return this.custId;
    }

    public String getName() {
        return this.name;
    }

    public int getAge() {
        return this.age;
    }

    public void setCustId(int custId) {
        this.custId = custId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof Customer)) return false;
        final Customer other = (Customer) o;
        if (!other.canEqual((Object) this)) return false;
        if (this.custId != other.custId) return false;
        final Object this$name = this.name;
        final Object other$name = other.name;
        if (this$name == null ? other$name != null : !this$name.equals(other$name)) return false;
        if (this.age != other.age) return false;
        return true;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        result = result * PRIME + this.custId;
        final Object $name = this.name;
        result = result * PRIME + ($name == null ? 43 : $name.hashCode());
        result = result * PRIME + this.age;
        return result;
    }

    protected boolean canEqual(Object other) {
        return other instanceof Customer;
    }

    public String toString() {
        return "Customer(custId=" + this.custId + ", name=" + this.name + ", age=" + this.age + ")";
    }
}
