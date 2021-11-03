package com.zero.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zero.project.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{

}
