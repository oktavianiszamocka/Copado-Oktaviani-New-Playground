@IsTest
public with sharing class TriggerHandler_AccountTest {

    @TestSetup
    static void setup(){
        Account newAccount = new Account(Name = 'Test Account');
        insert newAccount;

    }

    @IsTest
    static void shouldUpdateToBeValid(){
        //given
        Account acc = [SELECT Name, Rating, IsValid__c from Account LIMIT 1];

        //when
        Test.startTest();
        acc.Rating = 'Hot';
        update acc;

        //then
        Account updatedAcc = [SELECT Name, Rating, IsValid__c from Account WHERE Id = :acc.Id LIMIT 1];
        System.assertEquals(true, updatedAcc.IsValid__c);
    }

    @IsTest
    static void shouldUpdateToBeInValid(){
        //given
        Account acc = [SELECT Name, Rating, IsValid__c from Account LIMIT 1];

        //when
        Test.startTest();
        acc.Rating = 'Cold';
        update acc;

        //then
        Account updatedAcc = [SELECT Name, Rating, IsValid__c from Account WHERE Id = :acc.Id LIMIT 1];
        System.assertEquals(false, updatedAcc.IsValid__c);
    }

}