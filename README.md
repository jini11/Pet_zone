# JSP를 이용한 '나도반함' 펫존 검색 웹 사이트


데이터베이스 프로그래밍 시간에 만든 펫존 검색 웹사이트입니다.


![image](https://user-images.githubusercontent.com/78905126/176642591-b7e9c54d-c738-4be0-9dee-165844129612.png)


## 펫존이란?  
펫존은 펫(pet)+존(zone)의 합성어로 반려동물과 같이 갈 수 있는 장소를 의미합니다.  

## 목표  
- JSP를 이용한 웹 사이트 구성  
- 웹 크롤러를 구성해 필요한 데이터 수집  

## 진행 기간  

11.17: 로그인 기능까지 구현 완료  
11.18: 회원가입 기능 구현 완료  
11.19-12.01: 로그아웃~옵션 별 펫존 보기 구현 완료  
12.02: 지역 별 펫존 보기 가능  
12.04: 즐겨찾기 추가/삭제 가능  
12.06: 모든 기능 구현 완료  
12.10: 발표 마무리   

=> 2021.10.25 ~ 2021.12.10(약 5주)  


## 역할 분담  
팀원 수 총 4명  
1: 프론트엔드 담당(1명)    
2: 풀스택 담당(2명)     
3: 데이터 수집 및 백엔드 담당(나)
 
## 나의 역할  

(1) 데이터 수집  
크롤러(selenium)를 만들어 약 1000개의 펫존 음식점, 카페 데이터를 수집했다.

(2) 데이터베이스 생성(mysql)  
데이터베이스를 생성하고 csv 파일을 데이터베이스에 load하였다.  

(3) JSP를 이용해 기능 구성  
`펫존 보기`, `즐겨찾기 추가` 기능 담당  

## 개발 환경    
(1) 크롤러(dog_shop.ipynb)
Google Colab, Selenium, Python 사용  
  
(2) 웹  
![image](https://user-images.githubusercontent.com/78905126/176638903-f2661681-0156-4c90-9304-1993fc4412f6.png)

## DB 테이블 구성  
![image](https://user-images.githubusercontent.com/78905126/176638998-f6208f98-557c-4d81-b638-b4621880a96c.png)

## 기능 정리 
#### (0) 개요    
![image](https://user-images.githubusercontent.com/78905126/176640823-bb5540ca-0fa0-489d-beda-7b8ec203e3be.png)

#### (1) 로그인  
![image](https://user-images.githubusercontent.com/78905126/176639819-3edbf046-294c-4fd8-b701-0c93cd469dcd.png)

#### (2) 회원가입  
![image](https://user-images.githubusercontent.com/78905126/176639805-a425576e-14c3-413f-af79-2082376e906a.png)

#### (3) ID/PW 찾기  
![image](https://user-images.githubusercontent.com/78905126/176639906-d66065a5-7c8d-42da-b171-069cb0f46cd2.png) 


![image](https://user-images.githubusercontent.com/78905126/176642242-b46aeb0e-70e6-4a56-b5d2-dede71d4af18.png)  
  

#### (4) 탈퇴하기  
![image](https://user-images.githubusercontent.com/78905126/176641478-32540ff5-27cc-4958-bf2a-17e052a98b5b.png)


#### (5) 펫존 보기  
##### - 옵션(전체, 숙소, 음식점, 야외) 별 펫존 보기  
![image](https://user-images.githubusercontent.com/78905126/176639747-e760f0c5-a523-4e99-b743-4f385fad95f3.png)  

##### - 지역 별 펫존 보기  
![image](https://user-images.githubusercontent.com/78905126/176639781-a79aa046-f1e6-4a8d-9aeb-409e9945396f.png)  
 
#### (6) 즐겨찾기 추가  
![image](https://user-images.githubusercontent.com/78905126/176640099-ca1885cd-c6dd-41c9-a7eb-fdfb1f3cac10.png)

#### (7) 마이페이지 정보 수정  
![image](https://user-images.githubusercontent.com/78905126/176640015-9938326c-8896-49ca-8cb6-e681f7d628b2.png)

#### (8) 즐겨찾기 삭제  
![image](https://user-images.githubusercontent.com/78905126/176641599-a1985cf1-2d06-414e-8182-e1b0f38b065b.png)

## 소감  

그동안 JSP가 어렵다고 해서 선뜻 시도를 못하고 있었는데, 이번 기회에 조원들과 CRUD 기능들을 구현할 수 있어 좋았다. 팀원들과 디스코드로 소통하며 웹 사이트를 만드는 과정이 재밌었고, 이번 프로젝트를 통해 이 분야에 내가 재미를 느낀다는 것을 깨달았다.    

아쉬운 점이 있다면, 처음이라 MVC 구조로 코드를 구현하지 못해 다음에 만들 땐 MVC 구조에 맞춰 구현해보고 싶다. 또한, 배포를 통해 실제 유저가 내가 만든 웹 사이트를 사용해보는 경험을 해보고 싶다.
