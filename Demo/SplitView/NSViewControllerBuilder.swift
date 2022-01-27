//
//  NSViewControllerBuilder.swift
//  Demo
//
//  Created by shunjie.dsj on 2022/1/27.
//

import SwiftUI

protocol _NSViewControllerBuilderProtocol {
    func build() -> [NSViewController]
}

struct _NSViewControllerBuilder {
    public var viewControllers: [NSViewController]

    init(_ views: AnyView...) {
        self.viewControllers = views.map({ v in
            NSHostingController(rootView: v) as NSViewController
        })
    }
}

extension _NSViewControllerBuilder: _NSViewControllerBuilderProtocol {
    func build() -> [NSViewController] {
        viewControllers
    }

    static func + (left: _NSViewControllerBuilder, right: _NSViewControllerBuilder) -> _NSViewControllerBuilder {
        var b = _NSViewControllerBuilder()
        b.viewControllers = left.viewControllers + right.viewControllers
        return b
    }
}

extension _NSViewControllerBuilder: View {
    typealias Body = Never

    var body: Never {
        fatalError()
    }
}

extension View {
    func toNSViewControllerBuilder() -> _NSViewControllerBuilder {
        if let b = self as? _NSViewControllerBuilder {
            return b
        } else {
            return _NSViewControllerBuilder(toAnyView())
        }
    }

    func toAnyView() -> AnyView {
        if let v = self as? AnyView {
            return v
        } else {
            return AnyView(self)
        }
    }
}


@resultBuilder struct NSViewControllerBuilder {
    static func buildEither(first: _NSViewControllerBuilder) -> _NSViewControllerBuilder {
        first
    }

    static func buildEither(second: _NSViewControllerBuilder) -> _NSViewControllerBuilder {
        second
    }

    static func buildIf(_ content: _NSViewControllerBuilder?) -> _NSViewControllerBuilder {
        content ?? _NSViewControllerBuilder()
    }

    static func buildLimitedAvailability(_ content: _NSViewControllerBuilder) -> _NSViewControllerBuilder {
        content
    }

    static func buildBlock() -> _NSViewControllerBuilder {
        EmptyView().toNSViewControllerBuilder()
    }

    static func buildBlock<Content>(_ content: Content) -> _NSViewControllerBuilder
    where Content : View {
        content.toNSViewControllerBuilder()
    }

    static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> _NSViewControllerBuilder
    where C0: View, C1: View {
        c0.toNSViewControllerBuilder() +
        c1.toNSViewControllerBuilder()
    }


    static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> _NSViewControllerBuilder
    where C0: View, C1: View, C2: View {
        c0.toNSViewControllerBuilder() +
        c1.toNSViewControllerBuilder() +
        c2.toNSViewControllerBuilder()
    }


    static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> _NSViewControllerBuilder
    where C0: View, C1: View, C2: View, C3: View {
        c0.toNSViewControllerBuilder() +
        c1.toNSViewControllerBuilder() +
        c2.toNSViewControllerBuilder() +
        c3.toNSViewControllerBuilder()
    }


    static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> _NSViewControllerBuilder
    where C0: View, C1: View, C2: View, C3: View, C4: View {
        c0.toNSViewControllerBuilder() +
        c1.toNSViewControllerBuilder() +
        c2.toNSViewControllerBuilder() +
        c3.toNSViewControllerBuilder() +
        c4.toNSViewControllerBuilder()
    }


    static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> _NSViewControllerBuilder
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View {
        c0.toNSViewControllerBuilder() +
        c1.toNSViewControllerBuilder() +
        c2.toNSViewControllerBuilder() +
        c3.toNSViewControllerBuilder() +
        c4.toNSViewControllerBuilder() +
        c5.toNSViewControllerBuilder()
    }


    static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> _NSViewControllerBuilder
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View {
        c0.toNSViewControllerBuilder() +
        c1.toNSViewControllerBuilder() +
        c2.toNSViewControllerBuilder() +
        c3.toNSViewControllerBuilder() +
        c4.toNSViewControllerBuilder() +
        c5.toNSViewControllerBuilder() +
        c6.toNSViewControllerBuilder()
    }


    static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> _NSViewControllerBuilder
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View {
        c0.toNSViewControllerBuilder() +
        c1.toNSViewControllerBuilder() +
        c2.toNSViewControllerBuilder() +
        c3.toNSViewControllerBuilder() +
        c4.toNSViewControllerBuilder() +
        c5.toNSViewControllerBuilder() +
        c6.toNSViewControllerBuilder() +
        c7.toNSViewControllerBuilder()
    }


    static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> _NSViewControllerBuilder
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View {
        c0.toNSViewControllerBuilder() +
        c1.toNSViewControllerBuilder() +
        c2.toNSViewControllerBuilder() +
        c3.toNSViewControllerBuilder() +
        c4.toNSViewControllerBuilder() +
        c5.toNSViewControllerBuilder() +
        c6.toNSViewControllerBuilder() +
        c7.toNSViewControllerBuilder() +
        c8.toNSViewControllerBuilder()
    }


    static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> _NSViewControllerBuilder
    where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View {
        c0.toNSViewControllerBuilder() +
        c1.toNSViewControllerBuilder() +
        c2.toNSViewControllerBuilder() +
        c3.toNSViewControllerBuilder() +
        c4.toNSViewControllerBuilder() +
        c5.toNSViewControllerBuilder() +
        c6.toNSViewControllerBuilder() +
        c7.toNSViewControllerBuilder() +
        c8.toNSViewControllerBuilder() +
        c9.toNSViewControllerBuilder()
    }
}

extension NSViewControllerBuilder {
    static func buildFinalResult(_ component: _NSViewControllerBuilder) -> [NSViewController] {
        component.build()
    }
}
