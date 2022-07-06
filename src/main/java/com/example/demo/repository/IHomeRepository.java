package com.example.demo.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Underwear;
@Repository
public interface IHomeRepository extends JpaRepository<Underwear, Long>{
	@Query("SELECT DISTINCT p FROM Underwear p JOIN p.category c WHERE c.nameCate LIKE %?1% OR p.productName LIKE %?1%")
	public Page<Underwear> findAllType(String keyWord, Pageable pageable);
	
}
