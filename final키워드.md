
final 키워드는 변수(variable), 메서드(method), 또는 클래스(class)에 사용될 수 있습니다. <br/>
이 final 키워드는 어떤 곳에 사용되냐에 따라 다른 의미를 가집니다. <br/>
하지만 final 키워드를 붙이면 무언가를 제한한다는 의미를 가지는 것은 공통적이 성격입니다.

### final 변수(variable)

변수에 final을 붙여보겠습니다. 변수에 final을 붙이면 이 변수는 수정할 수 없다는 의미를 가집니다. <br/>
수정될 수 없기 때문에 초기화 값은 필수적입니다. 만약에 객체안의 변수라면 생성자, static 블럭을 통한 초기화까지는 허용합니다.

* 상수라고도 불림
* 변수를 선언과 동시에 초기화하여 이후에 값을 수정하지 못한다
* 오직 get만 가능

```java

public static void main(String[] args) {
        final int count = 10;
        
        count = 13; // 컴파일 에러
    }

```

선언과 동시에 final로 초기화를 진행해 10을 대입 <br/>
count변수에 값을 넣을 수 없다는 뜻

<br/>

```java

public class Service {

  public void variableFinal() {

    final int value = 2;
    final Person person = new Person("하이", 15);

    System.out.println("value = " + value);
    System.out.println("person_1 = " + person);

    // value = 2; // 컴파일 에러
    // 아래의 경우에도 getter/setter에 final을 걸어두면 컴파일에러 발생
    person.setAge(10);
    person.setName("안녕");

    System.out.println("person_2 = " + person);
    // person = new Person("hiii", 20); // 컴파일 에러
  }
}

class Person {

  private String name;

  private int age;

  //.. get, set, toString 메서드 존재하나 길이상 생략
}

value = 2
person_1 = Person{name='하이', age=15}
person_2 = Person{name='안녕', age=10}

```

<br/>

일반적으로 final 변수는 프로그램 전체에 결쳐 사용되는 경우가 많기에 <br/>
위의 final int value = 2; 처럼 특정 메소드 내부에서 선언하기 보다는 클래스에 staitc 키워드와 함께 정의된다

```java

static final int Count = 10;
    static final double Pi = 3.14;
    static final String name = "Config";

    public static void main(String[] args) {
        
    }

```

모든 타입(int, double, String) 에 적용이 가능하다

소스상에서 필요할 때마다 "Config" 라는 값을 입력해야 한다면 오타 발생 확률도 높고, 개발중 "Setting"이라는 이름으로 변경할 상황에서 <br/>
일일이 수정해야하는 불편함이 발생 , 이 상황에서 static final 변수로 선언하여 사용한다면 안정성, 편리성을 동시에 보장

<br/>

### final 메소드

* 오버라이딩 불가
* 상속받은 그대로 사용해야 한다

```java

public class Fruit {

    
    public String name;

    public final String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public class Banana extends Fruit{

        // 컴파일 오류 발생
        @Override
        public String getName() {
            return super.getName();
        }

        @Override
        public void setName(String name) {
            super.setName(name);
        }
    }
}

```

Fruit 클래스에는 name에 대한 set/get 메소드가 존재 <br/>
Banana클래스는 Fruit 클래스를 상속받아 set 메소드에서는 원하는 형태로 오버라이딩이 되었지만

get메소드에는 컴파일 에러가 발생하며 오버라이딩이 불가

<br/>

### final 클래스


final 키워드를 클래스에 붙이면 상속 불가능 클래스가 됩니다. <br/>
즉, 다른 클래스에서 상속하여 재정의를 할 수 없는 것입니다. 대표적인 클래스로 Integer와 같은 랩퍼(Wrapper) 클래스가 있습니다. <br/>
클래스 설계시 재정의 여부를 생각해서 재정의 불가능하게 사용하고 싶다면 final로 등록하는게 추후 유지보수차원에서 좋습니다.

```java

public **final** class Fruit {

    public String name;

    public final String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public class Banana extends Fruit{

        // 컴파일 오류 발생
        
    }
}

```













