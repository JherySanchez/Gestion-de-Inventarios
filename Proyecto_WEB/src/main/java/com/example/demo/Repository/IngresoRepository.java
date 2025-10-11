package com.example.demo.Repository;

import com.example.demo.Model.Ingreso;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IngresoRepository extends JpaRepository<Ingreso, Integer> {
    
}
