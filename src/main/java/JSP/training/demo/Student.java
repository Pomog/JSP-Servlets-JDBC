package JSP.training.demo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Student {
    private String firstName;
    private String lastName;
    private String email;

    public String getFirstName() {
        return firstName;
    }
}


