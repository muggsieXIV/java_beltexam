package com.bww.java_beltexam.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.bww.java_beltexam.models.TvShow;

@Repository
public interface TvShowRepository extends CrudRepository<TvShow, Long> {
	@Query(value="SELECT * FROM tv_shows ORDER BY rating DESC", nativeQuery = true)
	List<TvShow> descShow();
}