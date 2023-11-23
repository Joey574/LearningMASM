#pragma once

#include "MasmTest.g.h"

namespace winrt::LearningMASM::implementation
{
    struct MasmTest : MasmTestT<MasmTest>
    {
        MasmTest() 
        {
            // Xaml objects should not call InitializeComponent during construction.
            // See https://github.com/microsoft/cppwinrt/tree/master/nuget#initializecomponent
        }

        int32_t MyProperty();
        void MyProperty(int32_t value);

        void ClickHandler(Windows::Foundation::IInspectable const& sender, Windows::UI::Xaml::RoutedEventArgs const& args);
    };
}

namespace winrt::LearningMASM::factory_implementation
{
    struct MasmTest : MasmTestT<MasmTest, implementation::MasmTest>
    {
    };
}
