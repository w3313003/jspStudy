package Human;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope("prototype")
public class Customer {
    private People people;
    public Customer(People people) {
        this.people = people;
    }
    public People getPeople() {
        return people;
    }
    public void setPeople(People people) {
        this.people = people;
    }

    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof Customer)) return false;
        final Customer other = (Customer) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$people = this.getPeople();
        final Object other$people = other.getPeople();
        if (this$people == null ? other$people != null : !this$people.equals(other$people)) return false;
        return true;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $people = this.getPeople();
        result = result * PRIME + ($people == null ? 43 : $people.hashCode());
        return result;
    }

    protected boolean canEqual(Object other) {
        return other instanceof Customer;
    }

    public String toString() {
        return "Customer(people=" + this.getPeople() + ")";
    }
}
