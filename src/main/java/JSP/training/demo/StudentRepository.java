package JSP.training.demo;

import org.springframework.data.repository.CrudRepository;

import javax.sql.DataSource;


public interface StudentRepository extends CrudRepository<StudentEntity, Integer> {

}
