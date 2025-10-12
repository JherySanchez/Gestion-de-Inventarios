package com.example.demo.Repository;

import java.time.LocalDateTime;

public interface ActivitiesDTO {

    String getNombre();
    int getCantidad();
    String getTipo();
    LocalDateTime  getFecha();
}
