//
//  HistoryPageTests.swift
//  RileyLink
//
//  Created by Pete Schwamb on 3/7/16.
//  Copyright © 2016 Pete Schwamb. All rights reserved.
//

import XCTest
@testable import MinimedKit

class HistoryPageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHistoryPageCRC() {
        let pumpModel = PumpModel.Model551
        do {
            let _ = try HistoryPage(pageData: NSData(hexadecimalString:          "6e2190050000000000000002be02be640000000000000000000000000000000000000000000000000000000000000000000000007b0100de0802101122007b0200c01602102c1c007b0000c000031000160007000002be22900000006e2290050000000000000002be02be640000000000000000000000000000000000000000000000000000000000000000000000007b0100de08031011220034640edc120310810123ef12031000101111117d0223ef12031000a2ce8aa0001011111100000000000000000000000000000000000000007b0200c01603102c1c0021001cce16031003000000100fd03603107b021edb1603102c1c0003000100011cdb160310820106dc16031000a2ce8aa0820108dc16031000101111117b0000c000041000160007000002b823900000006e2390050000000000000002b802b8640000000000000000000000000000000000000000000000000000000000000000000000007b0100de0804101122007b0200c01604102c1c007b0000c000051000160007000002be24900000006e2490050000000000000002be02be640000000000000000000000000000000000000000000000000000000000000000000000007b0100de0805101122007b0200c01605102c1c007b0000c000061000160007000002be25900000006e2590050000000000000002be02be640000000000000000000000000000000000000000000000000000000000000000000000007b0100de0806101122007b0200c01606102c1c007b0000c000071000160007000002be26900000006e2690050000000000000002be02be640000000000000000000000000000000000000000000000000000000000000000000000007b0100de08071011220081010bec0a071000a2ce8aa07d010bec0a071000a2ce8aa000000000000000000000000000000000000000000000000000820108c40b071000a2ce8aa081010cc40b071000a2ce8aa07d010cc40b071000a2ce8aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004475")!, pumpModel: pumpModel)
        } catch HistoryPage.Error.InvalidCRC {
            XCTFail("page decoding threw invalid crc")
        } catch HistoryPage.Error.UnknownEventType(let eventType) {
            XCTFail("unknown event type" + String(eventType))
        } catch {
            XCTFail("Unexpected exception...")
        }
    }
    
    func testHistoryPageInvalidCRC() {
        let pumpModel = PumpModel.Model551
        do {
            let _ = try HistoryPage(pageData: NSData(hexadecimalString:          "6e2190050000000000000002be02be640000000000000000000000000000000000000000000000000000000000000000000000007b0100de0802101122007b0200c01602102c1c007b0000c000031000160007000002be22900000006e2290050000000000000002be02be640000000000000000000000000000000000000000000000000000000000000000000000007b0100de08031011220034640edc120310810123ef12031000101111117d0223ef12031000a2ce8aa0001011111100000000000000000000000000000000000000007b0200c01603102c1c0021001cce16031003000000100fd03603107b021edb1603102c1c0003000100011cdb160310820106dc16031000a2ce8aa0820108dc16031000101111117b0000c000041000160007000002b823900000006e2390050000000000000002b802b8640000000000000000000000000000000000000000000000000000000000000000000000007b0100de0804101122007b0200c01604102c1c007b0000c000051000160007000002be24900000006e2490050000000000000002be02be640000000000000000000000000000000000000000000000000000000000000000000000007b0100de0805101122007b0200c01605102c1c007b0000c000061000160007000002be25900000006e2590050000000000000002be02be640000000000000000000000000000000000000000000000000000000000000000000000007b0100de0806101122007b0200c01606102c1c007b0000c000071000160007000002be26900000006e2690050000000000000002be02be640000000000000000000000000000000000000000000000000000000000000000000000007b0100de08071011220081010bec0a071000a2ce8aa07d010bec0a071000a2ce8aa000000000000000000000000000000000000000000000000000820108c40b071000a2ce8aa081010cc40b071000a2ce8aa07d010cc40b071000a2ce8aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004455")!, pumpModel: pumpModel)
            XCTFail("Should have thrown InvalidCRC")
        } catch HistoryPage.Error.InvalidCRC {
            // Happy path
        } catch HistoryPage.Error.UnknownEventType(let eventType) {
            XCTFail("unknown event type" + String(eventType))
        } catch {
            XCTFail("Unexpected exception...")
        }
    }
    
    
    func testTempBasalDecoding() {
        let pumpModel = PumpModel.Model551
        do {
            let page = try HistoryPage(pageData: NSData(hexadecimalString: "160179230c121033104a2a0c12100016014a2a0c1210330854000d121000160154000d12107b05541e0d1210180a007b064000101210200e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004876")!, pumpModel: pumpModel)
            
            let events = page.events
            XCTAssertEqual(events.count, 7)
            
            let duration = events[0] as! TempBasalDurationPumpEvent
            XCTAssertEqual(duration.duration, 30)
            XCTAssertEqual(duration.timestamp, NSDateComponents(gregorianYear: 2016, month: 4, day: 18, hour: 12, minute: 35, second: 57))
            
            let tempBasal = events[1] as! TempBasalPumpEvent
            XCTAssertEqual(tempBasal.rateType, TempBasalPumpEvent.RateType.Absolute)
            XCTAssertEqual(tempBasal.rate, 0.4)
            XCTAssertEqual(tempBasal.timestamp, NSDateComponents(gregorianYear: 2016, month: 4, day: 18, hour: 12, minute: 42, second: 10))
            
            let duration2 = events[2] as! TempBasalDurationPumpEvent
            XCTAssertEqual(duration2.duration, 30)
            XCTAssertEqual(duration2.timestamp, NSDateComponents(gregorianYear: 2016, month: 4, day: 18, hour: 12, minute: 42, second: 10))
            
        } catch HistoryPage.Error.InvalidCRC {
            XCTFail("page decoding threw invalid crc")
        } catch HistoryPage.Error.UnknownEventType(_) {
            XCTFail("unknown event type")
        } catch {
            XCTFail("Unexpected exception...")
        }
    }
    
    func testHistoryDecoding() {
        let pumpModel = PumpModel.Model551
        do {
            let page = try HistoryPage(pageData: NSData(hexadecimalString: "5be409a20a1510325000784b502800a400002400a8965c0b404fc038cbd008d5d0010080008000240009a24a15107b0500800c1510180a000ade19a32c15105bde2ba30c1510325000b44b5024006c0000200070965c0b4c78c03482c040c8c001007000700020002ba34c15100a0c22932d75903f2122938d7510c527ad5b0006900f15101a5000b44b500000380000000038965c0e70a1c04c19d03423d04069d00100380038000c0006904f15107b060080101510200e005b0034ab1015100d5000784b500000280000000028965c113858c070f8c04c70d0347ad040c0d00100280028001c0034ab5015100ab005863175903f360586117510c527ad5bb01486111510005100784b50940000000038005c965c14281fc0386fc0700fd04c87d03491d040d7d001005c005c00380014865115105b002291121510285000784b500000840000000084965c145c48c02866c038b6c07056d04cced034d8d0010084008400480022915215107b0700801315102610002100038414151003000000360785341510064a097e009e54b5100c4a03a11415107b0704a11415102610007b0704a11415102610007b0710a1141510261000030003000306a11415100ae937a23475103f1d37a2347510c527ad5be91ea3141510165000784b502c00480000140060965c0e848cc05cd2c028f0c03840d001006000600014001ea35415107b0800801515102a13000a5621ba3515905b5623ba151510005100b455505800000000340024965c116053c084dfc05c25d02843d03893d0010024002400340023ba5515105b00188c161510005000b455500000000000000000965c142411c06061c084edc05c33d02851d038a1d00100180018004c00188c5615100a7339ac3615905b7305ad161510005100b455506800000000480020965c171828c02432c06082c0840ed05c54d02872d038c2d0010034003400440005ad5615100a55158c3775903f2a158cb77510c527ad5b55278c171510005100b455505800000000600000965c1a341bc01843c0244dc0609dc08429d05c6fd0288dd038ddd00100180018006000278c5715100a1930b73715905b1901b8171510005100b455503c00000000440000965c1a1833c03447c0186fc02479c060c9c08455d05c9bd028b9d0010018001800440001b85715107b000080001610000e0007000004f035100000006e351005112ce9b00a000004f001401903b04b00dd01a4013c00d0000005070200040000000000000000de730000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fc5e")!, pumpModel: pumpModel)
            
            let events = page.events
            XCTAssertGreaterThan(events.count, 20)
            
            let bolusWizard = events[0] as! BolusWizardEstimatePumpEvent
            XCTAssertEqual(bolusWizard.bgTargetHigh, 150)
            XCTAssertEqual(bolusWizard.bgTargetLow, 80)
            XCTAssertEqual(bolusWizard.bloodGlucose, 228)
            XCTAssertEqual(bolusWizard.bolusEstimate, 4.2)
            XCTAssertEqual(bolusWizard.carbohydrates, 50)
            XCTAssertEqual(bolusWizard.carbRatio, 12.0)
            XCTAssertEqual(bolusWizard.correctionEstimate, 1.0)
            XCTAssertEqual(bolusWizard.foodEstimate, 4.1)
            XCTAssertEqual(bolusWizard.insulinSensitivity, 75)
            XCTAssertEqual(bolusWizard.unabsorbedInsulinTotal, 0.9)
            XCTAssertEqual(bolusWizard.timestamp, NSDateComponents(gregorianYear: 2016, month: 2, day: 21, hour: 10, minute: 34, second: 9))
            
            let bolus = events[1] as! BolusNormalPumpEvent
            XCTAssertEqual(bolus.amount, 3.2)

            XCTAssertEqual(bolus.type, BolusNormalPumpEvent.BolusType.Normal)
            XCTAssertEqual(bolus.duration, 0)
            XCTAssertEqual(bolus.programmed, 3.2)
            XCTAssertEqual(bolus.unabsorbedInsulinTotal, 0.9)
            XCTAssertEqual(bolus.timestamp, NSDateComponents(gregorianYear: 2016, month: 2, day: 21, hour: 10, minute: 34, second: 9))
            
            let unabsorbedInsulinRecords = bolus.unabsorbedInsulinRecord!.records
            XCTAssertEqual(unabsorbedInsulinRecords.count, 3)
            XCTAssertEqual(unabsorbedInsulinRecords[0].amount, 1.6)
            XCTAssertEqual(unabsorbedInsulinRecords[0].age, 79)
            XCTAssertEqual(unabsorbedInsulinRecords[1].amount, 1.4)
            XCTAssertEqual(unabsorbedInsulinRecords[1].age, 459)
            XCTAssertEqual(unabsorbedInsulinRecords[2].amount, 0.2)
            XCTAssertEqual(unabsorbedInsulinRecords[2].age, 469)
            
            let basalProfileStart = events[2] as! BasalProfileStartPumpEvent
            XCTAssertEqual(basalProfileStart.offset, 43200000)
            XCTAssertEqual(basalProfileStart.rate, 0.25)
            XCTAssertEqual(basalProfileStart.profileIndex, 5)
            XCTAssertEqual(basalProfileStart.timestamp, NSDateComponents(gregorianYear: 2016, month: 2, day: 21, hour: 12, minute: 0, second: 0))
            
            let calBGForPH = events[3] as! CalBGForPHPumpEvent
            XCTAssertEqual(calBGForPH.amount, 222)
            XCTAssertEqual(calBGForPH.timestamp, NSDateComponents(gregorianYear: 2016, month: 2, day: 21, hour: 12, minute: 35, second: 25))
            
            let bgReceived = events[7] as! BGReceivedPumpEvent
            XCTAssertEqual(bgReceived.amount, 268)
            XCTAssertEqual(bgReceived.meter, "c527ad")
            XCTAssertEqual(bgReceived.timestamp, NSDateComponents(gregorianYear: 2016, month: 2, day: 21, hour: 13, minute: 19, second: 34))
            
            let rewind = events[20] as! RewindPumpEvent
            XCTAssertEqual(rewind.timestamp, NSDateComponents(gregorianYear: 2016, month: 2, day: 21, hour: 20, minute: 4, second: 3))
            
            let prime = events[21] as! PrimePumpEvent
            XCTAssertEqual(prime.amount, 5.4)
            XCTAssertEqual(prime.primeType, "manual")
            XCTAssertEqual(prime.programmedAmount, 0.0)
            XCTAssertEqual(prime.timestamp, NSDateComponents(gregorianYear: 2016, month: 2, day: 21, hour: 20, minute: 5, second: 7))
            
            let sara6e = events[50] as! Sara6EPumpEvent
            // 2016-02-22T00:00:00
            let sara6eDate = NSDateComponents()
            sara6eDate.calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
            sara6eDate.year = 2016
            sara6eDate.month = 2
            sara6eDate.day = 21
            
            XCTAssertEqual(sara6e.timestamp, sara6eDate)
            
            sara6e.timestamp.timeZone = NSTimeZone(forSecondsFromGMT: -5 * 60 * 60)
            
            XCTAssertEqual(sara6e.dictionaryRepresentation["validDate"] as? String, "2016-02-21")
            
        } catch HistoryPage.Error.InvalidCRC {
            XCTFail("page decoding threw invalid crc")
        } catch HistoryPage.Error.UnknownEventType(_) {
            XCTFail("unknown event type")
        } catch {
            XCTFail("Unexpected exception...")
        }
    }
    
    func testHistoryDecoding523() {
        let pumpModel = PumpModel.Model523
        do {
            let page = try HistoryPage(pageData: NSData(hexadecimalString: "010052005200000042225465105b00443b1465100e5000784b5000002e000000002e785c0e1a18c03822c01658d002dad001002e002e004c00443b5465100a3361023605905b337202166510005100b455505800000000420016785c0e2e43c01a57c03861c01697d0010016001600420072025665107b00400000061000100007000002cb45100000006e45100500e7000002000002cb01512f017a35007b00d60016008e0000040101000400000000000000009b3300000000000000007b014000010610020c000aca48092106105bca4b09010610005000c850502800000000000028785c0e16c2c02efec01a12d0381cd001002800280000004c094106107b024000040610080d007b0340000606100c10005b006a130966101450006e4b5000004800000000487801004800480000006a134966107b0440000a0610140b000afa41362b06105bfa67360b6610475000b44b5044009c00000800d8785c05489fc001006800680008045d38ab6610010070007000080067368b66107b0540000c0610180a007b064000100610200e005b0043191266103c5000784b500000c800000000c8785c2c020ed00818d00822d00a2cd00836d00840d00a4ad00854d0085ed00a68d00872d0087cd06286d01690d0010064001c0000066b1ab26610010064006400000043199266107b0740001306102610001e0165121306107b076e121306102610001f206e12130610210074121306101a0062141306101a01771413061003000000436a153306107b07661b13061026100003000300035c1b1306107b08401e1406102915000a825b103506905b826010150610005100b455507c000000000c0070785c200279c00483c0068dc00697c006a1c068abc002b9d008c3d008cdd00ad7d05b826210150610005100b455507c000000000c0070785c200279c00483c0068dc00697c006a1c068abc002b9d008c3d008cdd00ad7d00100700070000c0062105506100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002c4d")!, pumpModel: pumpModel)
            
            let events = page.events
            XCTAssertGreaterThan(events.count, 20)
            
            let bolus = events[0] as! BolusNormalPumpEvent
            XCTAssertEqual(bolus.amount, 2.05)
            XCTAssertEqual(bolus.type, BolusNormalPumpEvent.BolusType.Normal)
            XCTAssertEqual(bolus.duration, 0)
            XCTAssertEqual(bolus.programmed, 2.05)
            XCTAssertEqual(bolus.unabsorbedInsulinTotal, 0.0)
            
            let timestamp = NSDateComponents(gregorianYear: 2016, month: 4, day: 5, hour: 20, minute: 34, second: 02)
            
            XCTAssertEqual(bolus.timestamp, timestamp)
            
        } catch HistoryPage.Error.InvalidCRC {
            XCTFail("page decoding threw invalid crc")
        } catch HistoryPage.Error.UnknownEventType(_) {
            XCTFail("unknown event type")
        } catch {
            XCTFail("Unexpected exception...")
        }
        
    }
    
    func testHistoryDecodingBolusWizardSettings522() {
        let pumpModel = PumpModel.Model522
        do {
            let page = try HistoryPage(pageData: NSData(hexadecimalString: "5a0f7050141d10151300080000000000000000000000000000001e1414211e00000000000000000000005f69000000000000000000000000000000000000000000151300080000000000000000000000000000001e14142d1e00000000000000000000005f6900000000000000000000000000000000000000000044338c4055145d100016014055145d10333e445a145d10001601445a145d10335a4464145d100016014464145d10335e4069145d100016014069145d10010a0a004a6b341d10010f0f007979341d10010a0a00484b351d103383445a155d10001601445a155d10333c4369155d100016014369155d10011919006f7a351d10333c4b41165d100016014b41165d10333c4e55165d100016014e55165d10333c486e165d10001601486e165d10331b4c73165d100016014c73165d10333c5f4b175d100016015f4b175d1001080800554d371d10010808006a5d371d10333c6564175d100016016564175d1001050500766a371d10333c4878175d100016014878175d100700000a6a5d906d5d90050c00e8000000000a6a056234050830000005083000000000000005086413000000130c00e800000033394a50005e100016014a50005e1033394864005e100016014864005e1033004969005e100016014969005e1033004878005e100016014878005e1033004155015e100016014155015e103348495f015e10001601495f015e1033394564015e100016014564015e1033484a69015e100016014a69015e1033104c73015e100016014c73015e1033394578015e100016014578015e1033394550025e100016014550025e103314465a025e10001601465a025e1033004a5f025e100016014a5f025e103300456e025e10001601456e025e1033004241035e100016014241035e1033004550035e100016014550035e103300495f035e10001601495f035e103300456e035e10001601456e035e1033394678035e100016014678035e10338c4d46045e100016014d46045e10338c4664045e100016014664045e1033444a41055e100016014a41055e10010404007561281e1033447968085e100016017968085e10334a7972085e100016017972085e1033444478085e100016014478085e1033444250095e100016014250095e1033147954095e100016017954095e103344415a095e10001601415a095e10338c7968095e100016017968095e10011414006e6c291e1033447972095e100016017972095e10335841460a5e1000160141460a5e10010a0a0047492a1e10336841500a5e1000160141500a5e10010a0a006b512a1e103344415a0a5e10001601415a0a5e10330041500b5e1000160141500b5e103300455f0b5e10001601455f0b5e103346416e0b5e10001601416e0b5e10334641460c5e100000000000005a49")!, pumpModel: pumpModel)
            
            let events = page.events
            
            let bwsettings = events[0] as! ChangeBolusWizardSetupPumpEvent
            var timestamp = NSDateComponents(gregorianYear: 2016, month: 5, day: 29, hour: 20, minute: 16, second: 48)
            XCTAssertEqual(bwsettings.timestamp, timestamp)
            
            
            let tempBasal = events[1] as! TempBasalPumpEvent
            timestamp = NSDateComponents(gregorianYear: 2016, month: 5, day: 29, hour: 20, minute: 21, second: 0)
            
            XCTAssertEqual(tempBasal.timestamp, timestamp)
            
        } catch HistoryPage.Error.InvalidCRC {
            XCTFail("page decoding threw invalid crc")
        } catch HistoryPage.Error.UnknownEventType(_) {
            XCTFail("unknown event type")
        } catch {
            XCTFail("Unexpected exception...")
        }
        
    }

    func testHistoryDecodingChangeTimeBackward() throws {
        let pumpModel = PumpModel.Model523

        let page = try HistoryPage(pageData: NSData(hexadecimalString: "070000000061100000006e611005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000062100000006e621005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000063100000006e631005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000064100000006e641005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000065100000006e651005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000066100000006e661005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000067100000006e671005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000068100000006e681005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000069100000006e69100500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000006a100000006e6a100500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000006b100000006e6b100500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000006c100000006e6c100500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000006d100000006e6d100500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000006e100000006e6e100500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000006f100000006e6f1005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010010001000000047a83470101e0169a81410107b0071a81410100000001f2071a81410101e0150a91410107b0042af1410100000001f2042af141010170044af14501018006dae1450101e0171ae1410107b0079ae141010000000a89b")!, pumpModel: pumpModel)
        let events = page.events

        let previousEvent = events[36] as! TimestampedPumpEvent
        XCTAssertEqual(NSDateComponents(gregorianYear: 2016, month: 6, day: 16, hour: 20, minute: 47, second: 2), previousEvent.timestamp)

        let changeTime = events[37] as! ChangeTimePumpEvent
        let oldTimestamp = NSDateComponents(gregorianYear: 2016, month: 6, day: 16, hour: 20, minute: 47, second: 4)
        let timestamp = NSDateComponents(gregorianYear: 2016, month: 6, day: 16, hour: 20, minute: 46, second: 45)

        XCTAssertEqual(oldTimestamp, changeTime.oldTimestamp)
        XCTAssertEqual(timestamp, changeTime.timestamp)
        XCTAssertEqual(-19, changeTime.adjustmentInterval)

        let nextEvent = events[38] as! TimestampedPumpEvent
        XCTAssertEqual(NSDateComponents(gregorianYear: 2016, month: 6, day: 16, hour: 20, minute: 46, second: 49), nextEvent.timestamp)
    }

    func testHistoryQuestionable3b() throws {
        let pumpModel = PumpModel.Model723

        let page = try HistoryPage(pageData: NSData(hexadecimalString: "0615036800406001070636036f0040600107062f1dfc004020c107062f0e77004020c107062f0e88004020c107062f0e99004020c107062f0eaa004020c107062f0ebb004020c107062f0ee1004020c107062f0ef4004020c107062f0f05004020c10706110f12004020c10706150411004040a1070c151e400001076401164000010717001f4000010718000040000107190033410001071a003a500401071a010159040107063706753a5044a1071a0030590401070c3730590401071a01135a04010706560692305944a1073b84145a0401070c56275a040107070000000001870000006e0187050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001a0002570102070603036802576102070c030c4000010764010f400001071700134000010718000040000107070000000002870000006e0287050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002100054000010703000000000a402001077b001b4000010700000017001f420041071800758e0d5410070000000001870000006e01870500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000064004c8f0d14100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001305")!, pumpModel: pumpModel)
        let events = page.events

        XCTAssertEqual(42, events.count)
    }

    func testMealMarkerFor754() throws {
        let pumpModel = PumpModel.Model754

        let page = try HistoryPage(pageData: NSData(hexadecimalString: "0b664d61d542aa100b665040e142aa100b720061c143aa100b65ab6adb43aa107b0140c0040a100828007b0240de060a100d32000b730068d048aa100b73006fd149aa100b664d7ad649aa100a5472d7296a103f0a72d7896a10ce26920b73006adb49aa105b004af7090a10289000be3c3200005400000000543201005400540000004af7490a100b700072cb4aaa100b700072d54aaa100b700041e14aaa100b710041f04aaa100abe70da2d6a103f1770dacd6a10ce26925b694cdb0d0a10329000be3c322400680000080084325c0554d4040100a000a00008004cdb4d0a107b0340c00f0a101e32000a7b5ec12f6a103f0f5ec16f6a10ce26920b680057d64faa100a7574df2f6a103f0e74dfaf6a10ce2692140077f22f0a107b0077f22f0a100009000b73005cf44faa100b730057c250aa100b730055cb50aa100b664d4ed050aa100b664f57db50aa100b72006bc151aa1014017af3110a107b037bf3110a101e3200010078007800000051f4510a105b0058c3120a10469000be3c320000900000000090325c08781204a016140100a000a000780058c3520a100b730068ea52aa100b73004ef852aa100a3f70f8326a103f0770f8f26a10ce26920b730057c753aa105b0042e9130a10289000be3c320000540000000054325c0e4260045e6a04787404a07814010054005400980042e9530a100aa35ae5346a103f145ae5746a10ce26925b5a6be5140a10009000be3c371400000000880000375c11543e044298045ea20478ac04a0b0147c014bfb140a1081016dc3150a1000a2148cc87d016dc3150a1000a2148cc8000000000000000000000000000000000000000000000000000b730052ee56aa100b73005ef856aa107b0440c0170a102e32000b664f57c757aa100b73005ccc57aa107b0040c0000b10002800070000067c6a900000006e6a9006007a3fbe070000067c041c3f02602500c800a800000140007802000201007a07510bd620020d00000d01000000000000640043c4000b100b730052c640ab1064017bc6000b100b73004ed040ab10335660d4000b1008163060d4000b100b73005ce040ab100b665657ea40ab100b664e55f340ab100b664d6bc141ab100b66525ccc41ab100b730056ea44ab100b665856c745ab1040005dc9050b100c010b690040c746ab10330073e1070b1008160073e1070b107b0273e1070b100d32000a7a72f0276b103f0f72f0476b10ce24cd5b4452f1070b10009000be3c320c0000000000000c3201000c000c00000052f1470b105b0066c7080b104c9000be3c320000a000000000a0325c050c16040100a000a0000c0066c7480b100b720051ee48ab100b65b25bcc49ab100b72005bf44bab100abe4ffa2b6b103f174ffacb6b10ce24cd33735cfa0b0b100816305cfa0b0b1073da")!, pumpModel: pumpModel)
        let events = page.events

        XCTAssertEqual(93, events.count)

        let mealMarker = events[75] as! JournalEntryMealMarkerPumpEvent
        
        XCTAssertEqual(JournalEntryMealMarkerPumpEvent.CarbUnits.Grams, mealMarker.carbUnits)
        XCTAssertEqual(268, mealMarker.carbohydrates)
        
        
        XCTAssertEqual(NSDateComponents(gregorianYear: 2016, month: 7, day: 11, hour: 5, minute: 9, second: 29), mealMarker.timestamp)

    }
    
    func testCalBGForPHWithHighBG() throws {
        let pumpModel = PumpModel.Model754
        
        let page = try HistoryPage(pageData: NSData(hexadecimalString: "7b0640c0100b10200e007b0740c0130b102610007b0840de140b102915007b0040c0000c1000100007000001576b900000006e6b90050000000000000001570157640000000000000000000000000000000000000000000000000000000000000000000000007b0140c0010c10020c007b0240c0040c10080d007b0340c0060c100c10007b0440c00a0c10140b007b0540c00c0c10180a007b0640c0100c10200e007b0740c0130c102610007b0840de140c102915007b0040c0000d1000100007000001576c900000006e6c90050000000000000001570157640000000000000000000000000000000000000000000000000000000000000000000000007b0140c0010d10020c007b0240c0040d10080d007b0340c0060d100c10007b0440c00a0d10140b007b0540c00c0d10180a007b0640c0100d10200e007b0740c0130d102610007b0840de140d102915007b0040c0000e1000100007000001576d900000006e6d90050000000000000001570157640000000000000000000000000000000000000000000000000000000000000000000000007b0140c0010e10020c007b0240c0040e10080d007b0340c0060e100c10007b0440c00a0e10140b007b0540c00c0e10180a007b0640c0100e10200e007b0740c0130e102610007b0840de140e102915000ad271c7376e103f1a71c7576e10c527ad7b0040c0000f1000100007000001576e900000006e6e900500d2d2d201000001570157640000000000000000000000000000000000000000000000000000000000000000000000007b0140c0010f10020c007b0240c0040f10080d007b0340c0060f100c10007b0440c00a0f10140b007b0540c00c0f10180a007b0640c0100f10200e007b0740c0130f102610007b0840de140f102915000a9a45c7366f103f1345c7566f10c527ad7b0040c000101000100007000001576f900000006e6f9005009a9a9a01000001570157640000000000000000000000000000000000000000000000000000000000000000000000007b0140c0011010020c007b0240c0041010080d007b0340c00610100c10007b0440c00a1010140b007b0540c00c1010180a0083014dd20d101040016fd20d10102c016f1266f20d10100a5077f22d101040004ef60d1010c8020a5878d5af10107b0640c0101010200e000a5857ca301010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a3af")!, pumpModel: pumpModel)
        let events = page.events
        
        XCTAssertEqual(67, events.count)

        let cal = events[64] as! CalBGForPHPumpEvent
        XCTAssertEqual(NSDateComponents(gregorianYear: 2016, month: 7, day: 16, hour: 15, minute: 21, second: 56), cal.timestamp)
        XCTAssertEqual(600, cal.amount)
        
        let cal2 = events[66] as! CalBGForPHPumpEvent
        XCTAssertEqual(NSDateComponents(gregorianYear: 2016, month: 7, day: 16, hour: 16, minute: 10, second: 23), cal2.timestamp)
        XCTAssertEqual(88, cal2.amount)

    }

}
