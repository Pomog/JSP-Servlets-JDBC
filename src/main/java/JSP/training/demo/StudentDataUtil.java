package JSP.training.demo;

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {
    public static List<Student> getStudents() {
        List<Student> students = new ArrayList<>();

        students.add(new Student("Mary", "Public", "test@gmail.com"));
        students.add(new Student("John", "Doe", "test2@gmail.com"));
        students.add(new Student("Ajay", "Rao", "test3@gmail.com"));

        return students;
    }
}
