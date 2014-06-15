package cz.kolomet.domain;

import java.util.Date;

import javax.persistence.MappedSuperclass;
import javax.validation.constraints.NotNull;

@MappedSuperclass
public abstract class Comment<T extends DomainEntity> extends DomainEntity {
	
	@NotNull
	private Date date;
	
	@NotNull
	private String text;
	
	@NotNull
	private T commented;
	
	public T getCommented() {
		return commented;
	}

	public void setCommented(T commented) {
		this.commented = commented;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
}
