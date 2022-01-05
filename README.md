# NumberBaseball
## Information
* 프로젝트 기간 : 2021.05.31. ~ 2021.06.04.
* 프로젝트 인원 : 2명 Marco(@Keeplo), Sanchez(@sanches37)
* 프로젝트 소개 
    > 숫자 입력으로 사용자의 가위바위보 또는 묵찌빠 
* Pull Requests
    * [Step 1](https://github.com/yagom-academy/ios-rock-paper-scissors/pull/61)
    * [Step 2](https://github.com/yagom-academy/ios-rock-paper-scissors/pull/70)
### Tech Stack
* Swift 5.4
* Xcode 12.5
* macOS 10.15
### Demo
<details><summary>Demo Image</summary><div markdown="1">

**잘못된 입력처리**<br>

    
**사용자 승리 시나리오**<br>


**컴퓨터 승리 시나리오**<br>


**게임 종료 동작**<br>

</div></details>

<details><summary>Psudo Code Text</summary><div markdown="1">

1. 콘솔을 통해 묵찌빠 게임을 실행 
2. <출력> : “가위(1), 바위(2), 보(3)! <종료 : 0> : “
3. <입력> 사용자 입력 
4. <조건> 입력된 숫자 0~3 인가 ? 
    * True -> 4번으로 
    * False -> 3번으로 
5. <선언> 사용자 숫자에 입력정보 초기화 
6. <조건> 입력된 숫자 0인가? 
    * True -> 묵찌빠 게임 함수 종료 
    * False -> 6번으로 
7. <선언> 컴퓨터 숫자 초기화 <- <함수> 임의의 수 생성
8. <함수> 가위바위보 승패판별
9. <출력> 승리 / 패배 / 비김 
10 .<조건> 가위바위보 승패가 비겼나? 
	* True -> 2번으로
	* False -> 11번으로 
11. <조건> 가위바위보 이겼나? 
	* True -> 12-1번으로
	* False -> 12-2번으로 
12. <선언> 턴 변수 초기화
    1. 턴 = .사용자
    2. 턴 = .컴퓨터
13. <출력> ”[\(턴) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :	 
14. <입력> 사용자 입력 
15. <조건> 입력된 숫자 0~3 인가 ? 
    * True -> 16번으로
    * False -> 턴.턴변경() -> 13번으로  
16. <선언> 사용자 숫자에 입력정보 초기화 
17. <조건> 입력된 숫자 0인가? 
    * True -> 묵찌빠 게임 함수 종료 
    * False -> 18번으로
18. <선언> 컴퓨터 숫자 초기화 <- <함수> 임의의 수 생성
19. <함수> 묵찌빠 게임 승패판별
20. <출력> “\(턴)의 승리!  
<조건> 
	1. 이겼을 때 -> 21번으로 
	2. 졌을 때 -> 턴.턴변경() -> 13번으로 
	3. 비겼을 때 -> 13번으로 
21. 묵찌빠 게임 함수 종료 
22. 콘솔 종료
</div></details>

<details><summary>FlowChart Image</summary><div markdown="1">

![묵찌빠-Page-2](https://user-images.githubusercontent.com/24707229/120636890-3012fd00-c4a9-11eb-9e27-b70f2da9b7f6.jpg)
</div></details>

## Troubleshootings
<details><summary>Enum rawValue의 용도 관련 - CustomStringConvertible</summary><div markdown="1">

다음과 같이 enum case의 rawValue를 이용해서 문자열을 제공하는 방법에 대해 고민함

rawValue는 case의 식별용도로 사용되는 사용이 좀 더 어울리기 때문에 case에 따라 필요한 문자열은 `CustomStringConvertible` 프로토콜을 채택시켜 `description` 프로퍼티를 이용해서 반환하는 형태로 변경함

</div></details>
<details><summary>협업을 위해 가독성과 해석가능한 형태의 코드 작성</summary><div markdown="1">

사용자에게 1~3 숫자를 입력받고 컴퓨터의 패를 1~3 중 임의의 수를 할당 받는 형태라서 두 수의 합 또는 차를 이용한 비교 연산으로 비즈니스 로직을 구현함. 

피드백을 통해 주석이 필요한 코드보다 코드 자체가 이해하기 쉽고 해석가능한 형태의 코드가 협업에서 중요하다는 내용을 적용함

</div></details>
<details><summary>분기처리 분리하기</summary><div markdown="1">

묵찌빠 앱에서는 단순히 잘못된 입력에 대한 로그만 반환하고 재입력을 요청하는 형태이다 보니 하나의 조건문으로 처리가 가능하지만
로직이 복잡해지거나 각 분기별로 발생할 수 있는 에러를 대처하기 위해서 가능하다면 기능을 분리해주는게 좋다고 생각해서 분리함


</div></details>
<br>


