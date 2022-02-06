Java에서 제공하는 Date, Time API는 부족한 기능 지원을 포함한 여러가지 문제점을 가지고 있었다. 

JDK 코어에서 이런 문제점들을 해결하고 더 좋고 직관적인 API들을 제공하기 위해 새롭게 재 디자인한 Date, Time API를 Java SE 8부터 제공한다.

오브젝트 자기 자신의 특정 요소를 가지고 오브젝트를 생성할 경우 of 메서드를 호출하면 되고, 다른 타입으로 변경할 경우에는 from 메서드를 호출하면 된다.

```java
 
public class LocalDateExam {
    public static void main(String[] args) {
        LocalDateTime timePoint = LocalDateTime.now(); // 현재의 날짜와 시간
        
        // 2012년 12월 12일의 시간에 대한 정보를 가지는 LocalDate객체를 만드는 방법  
        LocalDate ld1 = LocalDate.of(2012, Month.DECEMBER, 12); // 2012-12-12 from values

        // 17시 18분에 대한 LocalTime객체를 구한다.
        LocalTime lt1 = LocalTime.of(17, 18); // 17:18 (17시 18분)the train I took home today

        // 10시 15분 30초라는 문자열에 대한 LocalTime객체를 구한다.
        LocalTime lt2 = LocalTime.parse("10:15:30"); // From a String

        LocalDate theDate = timePoint.toLocalDate();
        Month month = timePoint.getMonth();
        int day = timePoint.getDayOfMonth();
        int hour = timePoint.getHour();
        int minute = timePoint.getMinute();
        int second = timePoint.getSecond();
        // 달을 숫자로 출력한다 1월도 1부터 시작하는 것을 알 수 있습니다.
        System.out.println(month.getValue() + "/" + day + "  " + hour + ":" + minute + ":" + second);
    }
}


```
