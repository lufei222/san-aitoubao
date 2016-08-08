package claim.domain;

import java.util.Optional;

/**
 * Created by luosan on 2016/7/25.
 */
public class Person {
    private Optional name;
    private  Integer id;
    private  String hobby;
//    public Optional<String> adWord = Optional.empty();
  /*  public Optional<String> getAdWord() {
        return this.adWord;
    }

    public void setAdWord(Optional<String> adWord) {
        this.adWord = adWord;
    }*/
    public Optional getName() {
        return name;
    }

    public void setName(Optional name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }
}
