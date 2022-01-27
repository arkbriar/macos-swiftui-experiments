//
//  ViewControllerBuilder.swift
//  Demo
//
//  Created by shunjie.dsj on 2022/1/26.
//

import SwiftUI

@resultBuilder struct ViewControllerBuilder {
    static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View {
        ViewBuilder.buildEither(first: first)
    }

    static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View {
        ViewBuilder.buildEither(second: second)
    }

    static func buildIf<Content>(_ content: Content?) -> Content? where Content : View {
        ViewBuilder.buildIf(content)
    }

    static func buildLimitedAvailability<Content>(_ content: Content) -> AnyView where Content : View {
        ViewBuilder.buildLimitedAvailability(content)
    }

    static func buildBlock() -> EmptyView {
        ViewBuilder.buildBlock()
    }

    static func buildBlock<Content>(_ content: Content) -> TupleView<Content>
    where Content : View {
        TupleView((ViewBuilder.buildBlock(content)))
    }

    static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)>
    where C0: View, C1: View {
        ViewBuilder.buildBlock(c0, c1)
    }

    static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> TupleView<(C0, C1, C2)>
    where C0: View, C1: View, C2: View {
        ViewBuilder.buildBlock(c0, c1, c2)
    }

    static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> TupleView<(C0, C1, C2, C3)>
    where C0: View, C1: View, C2: View, C3: View {
        ViewBuilder.buildBlock(c0, c1, c2, c3)
    }

    static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> TupleView<(C0, C1, C2, C3, C4)>
    where C0: View, C1: View, C2: View, C3: View, C4: View {
        ViewBuilder.buildBlock(c0, c1, c2, c3, c4)
    }

    static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> TupleView<(C0, C1, C2, C3, C4, C5)>
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View {
        ViewBuilder.buildBlock(c0, c1, c2, c3, c4, c5)
    }

    static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> TupleView<(C0, C1, C2, C3, C4, C5, C6)>
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View {
        ViewBuilder.buildBlock(c0, c1, c2, c3, c4, c5, c6)
    }

    static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)>
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View {
        ViewBuilder.buildBlock(c0, c1, c2, c3, c4, c5, c6, c7)
    }

    static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)>
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View {
        ViewBuilder.buildBlock(c0, c1, c2, c3, c4, c5, c6, c7, c8)
    }

    static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View {
        ViewBuilder.buildBlock(c0, c1, c2, c3, c4, c5, c6, c7, c8, c9)
    }
}

extension ViewControllerBuilder {
    typealias FinalResult = [NSViewController]

    static func buildNSViewController<Content>(content: Content) -> NSViewController?
    where Content: View {
        if content is _OptionalProtocol {
            if (content as! _OptionalProtocol).isNil() {
                return nil
            }
            return NSHostingController(rootView: content)
        } else {
            return NSHostingController(rootView: content)
        }
    }

    static func buildFinalResult(_ content: EmptyView) -> FinalResult {
        return []
    }

    static func buildFinalResult<C0>(_ content: TupleView<C0>) -> FinalResult
    where C0: View {
        var viewControllers: [NSViewController] = []
        if let viewController = buildNSViewController(content: content.value) {
            viewControllers.append(viewController)
        }
        return viewControllers
    }

    static func buildFinalResult<C0, C1>(_ content: TupleView<(C0, C1)>) -> FinalResult
    where C0: View, C1: View {
        var viewControllers: [NSViewController] = []
        if let viewController = buildNSViewController(content: content.value.0) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.1) {
            viewControllers.append(viewController)
        }
        return viewControllers
    }


    static func buildFinalResult<C0, C1, C2>(_ content: TupleView<(C0, C1, C2)>) -> FinalResult
    where C0: View, C1: View, C2: View {
        var viewControllers: [NSViewController] = []
        if let viewController = buildNSViewController(content: content.value.0) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.1) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.2) {
            viewControllers.append(viewController)
        }
        return viewControllers
    }


    static func buildFinalResult<C0, C1, C2, C3>(_ content: TupleView<(C0, C1, C2, C3)>) -> FinalResult
    where C0: View, C1: View, C2: View, C3: View {
        var viewControllers: [NSViewController] = []
        if let viewController = buildNSViewController(content: content.value.0) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.1) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.2) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.3) {
            viewControllers.append(viewController)
        }
        return viewControllers
    }


    static func buildFinalResult<C0, C1, C2, C3, C4>(_ content: TupleView<(C0, C1, C2, C3, C4)>) -> FinalResult
    where C0: View, C1: View, C2: View, C3: View, C4: View {
        var viewControllers: [NSViewController] = []
        if let viewController = buildNSViewController(content: content.value.0) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.1) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.2) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.3) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.4) {
            viewControllers.append(viewController)
        }
        return viewControllers
    }


    static func buildFinalResult<C0, C1, C2, C3, C4, C5>(_ content: TupleView<(C0, C1, C2, C3, C4, C5)>) -> FinalResult
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View {
        var viewControllers: [NSViewController] = []
        if let viewController = buildNSViewController(content: content.value.0) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.1) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.2) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.3) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.4) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.5) {
            viewControllers.append(viewController)
        }
        return viewControllers
    }


    static func buildFinalResult<C0, C1, C2, C3, C4, C5, C6>(_ content: TupleView<(C0, C1, C2, C3, C4, C5, C6)>) -> FinalResult
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View {
        var viewControllers: [NSViewController] = []
        if let viewController = buildNSViewController(content: content.value.0) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.1) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.2) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.3) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.4) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.5) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.6) {
            viewControllers.append(viewController)
        }
        return viewControllers
    }


    static func buildFinalResult<C0, C1, C2, C3, C4, C5, C6, C7>(_ content: TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)>) -> FinalResult
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View {
        var viewControllers: [NSViewController] = []
        if let viewController = buildNSViewController(content: content.value.0) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.1) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.2) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.3) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.4) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.5) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.6) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.7) {
            viewControllers.append(viewController)
        }
        return viewControllers
    }


    static func buildFinalResult<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ content: TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)>) -> FinalResult
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View {
        var viewControllers: [NSViewController] = []
        if let viewController = buildNSViewController(content: content.value.0) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.1) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.2) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.3) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.4) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.5) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.6) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.7) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.8) {
            viewControllers.append(viewController)
        }
        return viewControllers
    }


    static func buildFinalResult<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ content: TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>) -> FinalResult
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View {
        var viewControllers: [NSViewController] = []
        if let viewController = buildNSViewController(content: content.value.0) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.1) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.2) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.3) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.4) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.5) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.6) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.7) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.8) {
            viewControllers.append(viewController)
        }
        if let viewController = buildNSViewController(content: content.value.9) {
            viewControllers.append(viewController)
        }
        return viewControllers
    }
}
