### 추상클래스

추상클래스는 추상메소드를 선언할 수 있는 클래스를 의미합니다. 

또한 추상클래스는 클래스와는 다르게 상속받는 클래스 없이 그 자체로 인스턴스를 생성할 수는 없습니다. 

abstract로 선언된 클래스는 직접적으로 사용이 불가하며 반드시 상속하는 클래스를 만들어서 사용해야 한다(강제한다)


- 추상메소드

추상메소드는 설계만 되어있으며 수행되는 코드에 대해서는 작성이 안된 메소드

이처럼, 미완성으로 남겨두는 이유는 상속받는 클래스 마다 반드시 동작이 달라지는 경우에 **상속받는 클래스 작성자가 반드시 작성**하도록하기 위함

메소드는 있지만 중괄호 안에 있는 구현체는 없다는 뜻

- 형식

abstract 리턴타입 메소드이름();

- 예제

```java

abstract class Bird { // 추상클래스 선언
    private int x, y, z;

    void fly(int x, int y, int z) {
        printLocation();
        System.out.println("이동합니다.");
        this.x = x;
        this.y = y;
        if (flyable(z)) { // 만약 날 수 있다면 z로 이동시킬거야
            this.z = z;
        } else {
            System.out.println("그 높이로는 날 수 없습니다");
        }
        printLocation();
    }
    
    // 날지 못하는 새를 위한 나타내기 위한 추상메서드 
    abstract boolean flyable(int z); // 여기서 {} 를 넣어주면 {} 값을 가질 수 없다고 에러가 난다

    public void printLocation() {
        System.out.println("현재 위치 (" + x + ", " + y + ", " + z + ")");
    }
}

class Pigeon extends Bird { // 추상 클래스는 그 자체로 인스턴스를 생성하지 못하기에 Main이 아닌 밖에 클래스 생성
    @Override  // 일반 클래스이고 싶으면 아까 구현했던 flyable을 구현해야 한다(강제성)
    boolean flyable(int z) {
        return z < 10000;
    }
}

class Peacock extends Bird {
    @Override
    boolean flyable(int z) {
        return false; // 공작새는 항상 날 수 없으니 false 값으로 값을 생성
    }
}

public class Main {
    public static void main(String[] args) {
        Bird pigeon = new Pigeon();
        Bird peacock = new Peacock();
        System.out.println("-- 비둘기 --");
        pigeon.fly(1, 1, 3);
        System.out.println("-- 공작새 --");
        peacock.fly(1, 1, 3);
        System.out.println("-- 비둘기 --");
        pigeon.fly(3, 3, 30000);
    }
}

```

### 인터페이스

인터페이스는 추상클래스보다 추상화 기준이 까다롭다. 추상화 같은 경우 추상 클래스 안에 public void 함수를 넣어 설계를 할 수 있지만

인터페이스의 경우에는 코드 작성이 안되고 어떠한 함수가 존재한다 정도로만 코드를 작성할 수 있다.

역시 추상화처럼 강제성을 부여한다. 또한 추상클래스와 다르게 다중 상속이 가능하다..!

---

인터페이스는 함수의 특징(method signature)인 접근제어자, 리턴타입, 메소드 이름만을 정의합니다. 함수의 내용은 없습니다.

인터페이스를 구현하는 클래스는 인터페이스에 존재하는 함수의 내용({} 중괄호 안의 내용)을 반드시 구현해야합니다.

```java

interface Bird {
    void fly(int x, int y, int z); // 멤버를 가지지 못하고 동작(메서드)만 정의
}

class Pigeon implements Bird{ // 실제 구현은 implements 키워드를 사용하여 구현 
    private int x,y,z; // 인터페이스는 필드가 없으니 클래스 내에서 적용해주어야 한다

    @Override
    public void fly(int x, int y, int z) {
        printLocation();
        System.out.println("날아갑니다.");
        this.x = x;
        this.y = y;
        this.z = z;
        printLocation();
    }
    public void printLocation() {
        System.out.println("현재 위치 (" + x + ", " + y + ", " + z + ")");
    }
}

public class Main {

    public static void main(String[] args) {
        Bird bird = new Pigeon();
        bird.fly(1, 2, 3);
//        bird.printLocation(); // compile error
    }
}

```

interface인 Bird 타입으로 선언한 bird 변수는 실제로 Pigeon 객체이지만, interface인 Bird 에 선언되지 않은 printLocation() 이라는 함수는 호출할 수 없습니다. 

interface type 으로 선언되어있는 부분에서는 실제 객체가 무엇이든지, interface에 정의된 행동만 할 수 있습니다.

### 인터페이스 vs 추상클래스 

- 인터페이스

1. 구현하려는 객체의 동작의 명세
2. 다중 상속 가능
3. implements를 이용하여 구현
4. 메소드 시그니처(이름, 파라미터, 리턴 타입)에 대한 선언만 가능

- 추상클래스

1. 클래스를 상속받아 이용 및 확장을 위함
2. 다중 상속 불가능 , 단일 상속
3. extends를 이용하여 구현
4. 추상메소드에 대한 구현 가능






