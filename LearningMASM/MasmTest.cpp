#include "pch.h"
#include "MasmTest.h"
#if __has_include("MasmTest.g.cpp")
#include "MasmTest.g.cpp"
#endif

using namespace winrt;
using namespace Windows::UI::Xaml;

namespace winrt::LearningMASM::implementation
{
    int32_t MasmTest::MyProperty()
    {
        throw hresult_not_implemented();
    }

    void MasmTest::MyProperty(int32_t /* value */)
    {
        throw hresult_not_implemented();
    }

    void MasmTest::ClickHandler(IInspectable const&, RoutedEventArgs const&)
    {
        Button().Content(box_value(L"Clicked"));
    }
}
