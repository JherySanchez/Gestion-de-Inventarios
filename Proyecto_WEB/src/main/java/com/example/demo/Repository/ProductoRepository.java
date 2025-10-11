package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.demo.Model.Producto;

@Repository
public interface ProductoRepository extends JpaRepository<Producto, Integer> {
    // Spring JPA los usa
    // save(), findById(), findAll(), deleteById(), etc.
}
