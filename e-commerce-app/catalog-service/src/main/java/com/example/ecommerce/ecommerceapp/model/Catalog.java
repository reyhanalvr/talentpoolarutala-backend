import javax.persistence.*;

@Entity
@Table(name = "catalog")
public class Catalog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String name;
    private String description;
    
    // Constructors, getters, setters
}
