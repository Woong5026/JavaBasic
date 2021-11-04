## Map

‘사람’을 예로 들면 누구든지 "이름" = "홍길동", "생일" = "몇 월 몇 일" 등으로 구분할 수 있다. 
자바의 맵(Map)은 이러한 대응관계를 쉽게 표현할 수 있게 해 주는 자료형이다. 

맵(Map)은 사전(dictionary)과 비슷하다. 
즉, people 이란 단어에 "사람", baseball 이라는 단어에 "야구"라는 뜻이 부합되듯이 Map은 Key와 Value라는 것을 한 쌍으로 갖는 자료형이다.

|key|value|
|------|---|
|people|사람|
|baseball|야구|


Map은 리스트나 배열처럼 순차적으로(sequential) 해당 요소 값을 구하지 않고 key를 통해 value를 얻는다. 맵(Map)의 가장 큰 특징이라면 key로 value를 얻어낸다는 점이다. 
baseball이란 단어의 뜻을 찾기 위해서 사전의 내용을 순차적으로 모두 검색하는 것이 아니라 baseball이라는 단어가 있는 곳만을 펼쳐보는 것이다.

### put

```java
HashMap<String, String> map = new HashMap<String, String>();
map.put("people", "사람");
map.put("baseball", "야구");
```

ey와 value가 String 형태인 HashMap을 만들고 위에서 보았던 예제의 항목값들을 입력해 보았다. 
key와 value는 위 예제에서 보듯이 put메소드를 이용하여 입력한다.

### get

```java
System.out.println(map.get("people"));
```

위와같이 get 메소드를 이용하면 value값을 얻을 수 있다. 위 예제는 결과로 "사람"이라는 문자열을 출력할 것이다.

### remove

remove 메소드는 맵(Map)의 항목을 삭제하는 메소드로 key값에 해당되는 아이템(key, value)을 삭제한 후 그 value 값을 리턴한다.

```java
System.out.println(map.remove("people"));
```

"people"에 해당되는 아이템(people:사람)이 삭제된 후 "사람"이 출력될 것이다.

### size

size 메소드는 Map의 갯수를 리턴한다.

```java
System.out.println(map.size());
```
"people", "baseball" 두 값을 가지고 있다가 "people"항목이 삭제되었으므로 1이 출력될 것이다.

다음은 테스트 시 사용되었던 코드 전체이다.

