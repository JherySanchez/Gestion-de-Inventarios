package com.example.demo.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.demo.Model.Usuario;


@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {

    //Spring se encarga de implementar los metodos
}
